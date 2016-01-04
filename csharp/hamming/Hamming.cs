using System;
using System.Linq;

namespace exercism.hamming
{
    public static class Hamming
    {
        public static int Compute(string x, string y)
        {
            if (x == null) throw new ArgumentNullException(nameof(x));
            if (y == null) throw new ArgumentNullException(nameof(y));

            if (x.Length != y.Length)
                throw new ArgumentOutOfRangeException(nameof(y),
                    "Hamming distance is not defined for inputs of unequal lengths");

            if (x.Length == 0 && y.Length == 0)
                return 0;

            if (x.Equals(y))
                return 0;

            var distance = x.Zip(y, (a, b) => new {a, b})
                .Count(pair => pair.a != pair.b);

            return distance;
        }
    }
}