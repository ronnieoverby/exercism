namespace Leap
{
    public static class Year
    {
        public static bool IsLeap(int year) => 
            year%400 == 0 || year%100 != 0 && year%4 == 0;
    }
}