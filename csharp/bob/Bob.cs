using System.Linq;

namespace exercism.bob
{
    /// <summary>
    /// Bob is a lackadaisical teenager. In conversation, his responses are very limited.
    /// Bob answers 'Sure.' if you ask him a question.
    /// He answers 'Whoa, chill out!' if you yell at him.
    /// He says 'Fine. Be that way!' if you address him without actually saying anything.
    /// He answers 'Whatever.' to anything else.
    /// </summary>
    public class Bob
    {
        public static string Hey(string input)
        {
            if (string.IsNullOrWhiteSpace(input))
                return "Fine. Be that way!";

            // a yelled question is yelling more than it's a question
            // so test for yelling before testing for questioning

            if (IsYelling(input))
                return "Whoa, chill out!";

            if (input.TrimEnd().EndsWith("?"))
                return "Sure.";

            return "Whatever.";
        }

        private static bool IsYelling(string input) =>
            input.Any(char.IsUpper) && !input.Any(char.IsLower);
    }

}
