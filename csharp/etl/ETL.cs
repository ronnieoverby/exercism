using System;
using System.Collections.Generic;
using System.Linq;

namespace exercism.etl
{
    public class ETL
    {
        private static Dictionary<string, int> _newSracbleScores = new Dictionary<string, int>(29);
        public static Dictionary<string, int> Transform(Dictionary<int, IList<string>> oldScrableScores)
        {
            ClearNewSracbleScoreTable();
            TransformAllListOfLettersToEntries(oldScrableScores);
            SortNewScrableScoresTable();

            return _newSracbleScores;
        }

        private static void TransformAllListOfLettersToEntries(Dictionary<int, IList<string>> oldScrableScores)
        {
            foreach (var oldScoreLetterEntry in oldScrableScores)
            {
                var score = GetScore(oldScoreLetterEntry);
                var letters = GetLetters(oldScoreLetterEntry);
                TransformListOfLettersToEntries(score, letters);
            }
        }

        private static void TransformListOfLettersToEntries(int score, IList<string> letters)
        {
            foreach (var letter in letters)
            {
                if (IsScrableScoreTableCointainsLetter(letter)) continue;

                AddLetterToScrableScoreTable(score, letter);
            }
        }

        private static void SortNewScrableScoresTable()
        {
            _newSracbleScores.OrderBy(entry => entry.Key);
        }

        private static bool IsScrableScoreTableCointainsLetter(string letter)
        {
            return _newSracbleScores.ContainsKey(letter);
        }

        private static void AddLetterToScrableScoreTable(int score, string letter)
        {
            _newSracbleScores.Add(letter.ToLower(), score);
        }

        private static int GetScore(KeyValuePair<int, IList<string>> oldScoreLetterEntry)
        {
            return oldScoreLetterEntry.Key;
        }

        private static IList<string> GetLetters(KeyValuePair<int, IList<string>> oldScoreLetterEntry)
        {
            return oldScoreLetterEntry.Value;
        }

        private static void ClearNewSracbleScoreTable()
        {
            _newSracbleScores.Clear();
        }
    }

    /* public static class ETL
     {
         public static Dictionary<string,int> Transform(Dictionary<int, IList<string>> old)
         {
             return (from pair in old
                 from letter in pair.Value
                 select new {letter, score = pair.Key})
                 .ToDictionary(
                     x => x.letter.ToLower(),
                     x => x.score,
                     StringComparer.CurrentCultureIgnoreCase);
         }
     }*/
}