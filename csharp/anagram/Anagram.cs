using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;

namespace exercism.anagram
{
    /// <summary>
    /// Given `"listen"` and a list of candidates like `"enlists" "google" "inlets" "banana"` 
    /// the program should return a list containing `"inlets"`.
    /// </summary>
    public class Anagram
    {
        private readonly string _word;
        private readonly char[] _chars;

        public Anagram(string word)
        {
            if (word == null) throw new ArgumentNullException(nameof(word));
            _word = word;
            _chars = word.ToUpper().OrderBy(c => c).ToArray();
        }

        public string[] Match(string[] candidates) => 
            candidates.Where(IsAnagram).ToArray();

        private bool IsAnagram(string candidate) =>
            !_word.Equals(candidate, StringComparison.CurrentCultureIgnoreCase)
            && _chars.SequenceEqual(candidate.ToUpper().OrderBy(c => c));
    }
}