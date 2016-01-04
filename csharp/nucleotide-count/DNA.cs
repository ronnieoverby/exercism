using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Runtime.Serialization;

public class DNA
{
    private readonly string _dna;
    private readonly Lazy<ReadOnlyDictionary<char, int>> _counts;

    public DNA(string dna)
    {
        _dna = (dna ?? "").ToUpper();

        var firstInvalid = _dna.FirstOrDefault(IsInvalid);
        if (firstInvalid != default(char))
            throw new InvalidNucleotideException($"Encountered an invalid nucleotide: {firstInvalid}", firstInvalid);

        _counts = new Lazy<ReadOnlyDictionary<char, int>>(CreateCounts);
    }

    private static readonly HashSet<char> ValidNucleotides = new HashSet<char> {'A', 'T', 'C', 'G'};
    private static bool IsInvalid(char arg) => !ValidNucleotides.Contains(arg);

    private ReadOnlyDictionary<char, int> CreateCounts()
    {
        var counts = ValidNucleotides.ToDictionary(n => n, _ => 0);

        foreach (var n in _dna)
            counts[n]++;

        return new ReadOnlyDictionary<char, int>(counts);
    }

    public ReadOnlyDictionary<char, int> NucleotideCounts => _counts.Value;

    public int Count(char c)
    {
        c = c.ToString().ToUpper()[0];

        if (IsInvalid(c))
            throw new InvalidNucleotideException($"Invalid nucleotide: {c}", c);

        return NucleotideCounts[c];
    }
}

[Serializable]
public class InvalidNucleotideException : Exception
{
    public char InvalidNucleotide { get; }

    public InvalidNucleotideException(string message, char invalidNucleotide) : base(message)
    {
        InvalidNucleotide = invalidNucleotide;
    }

    protected InvalidNucleotideException(
        SerializationInfo info,
        StreamingContext context, char invalidNucleotide) : base(info, context)
    {
        InvalidNucleotide = invalidNucleotide;
    }
}

