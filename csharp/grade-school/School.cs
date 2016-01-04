using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;

namespace exercism
{
    public class School
    {
        public class SchoolRoster
        {
            private readonly ConcurrentDictionary<int, List<string>> _roster =
                new ConcurrentDictionary<int, List<string>>();

            public ReadOnlyCollection<string> this[int grade]
            {
                get
                {
                    List<string> students;
                    if (!_roster.TryGetValue(grade, out students))
                        students = _roster[grade] = new List<string>();

                    return students.AsReadOnly();
                }
            }

            public int Count => _roster.Sum(x => x.Value.Count);

            public void Add(string studentName, int grade)
            {
                _roster.AddOrUpdate(grade,
                    _ => new List<string> {studentName},
                    (_, students) => students.Concat(new[] {studentName}).OrderBy(x => x).ToList()
                    );
            }
        }

        public SchoolRoster Roster { get; } = new SchoolRoster();

        public void Add(string studentName, int grade) => Roster.Add(studentName, grade);

        public ReadOnlyCollection<string> Grade(int grade) => Roster[grade];
    }
}