using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;

namespace exercism
{
    public static class Phrase
    {
        public static Dictionary<string, int> WordCount(string phrase) =>

            // remove unwanted characters from the phrase
            string.Concat(

                // replace all whitespace runs with single space
                Regex.Replace(phrase, @"\s+", " ")

                    // remove all except letters, digits, spaces, commas, apostrophes
                    .Where(c => char.IsLetterOrDigit(c)
                                || c == ' '
                                || c == ','
                                || c == '\'')
                )
                
                // split on spaces and commas
                .Split(new[] {',', ' '}, StringSplitOptions.RemoveEmptyEntries)

                // remove free standing apostrophes
                .Where(word => word.Any(c => c != '\''))

                // trim leading and trailing apostrophes on words
                .Select(word => word.Trim('\''))

                // count each word in the phrase
                .GroupBy(word => word.ToLower())
                .ToDictionary(g => g.Key, g => g.Count());
    }
}