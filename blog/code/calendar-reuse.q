// how often can a calendar be re-used?
// i.e. when do the days of the weeks line up with the dates
// e.g the calendar for 2026 is exactly the same as 2037
// https://www.timeanddate.com/calendar/?year=2026&country=32
// https://www.timeanddate.com/calendar/?year=2037&country=32

// to determine the next repeating year
// if it's a leap year, add 28 years (unless
// logic is not right here - need to skip 2100 in leap years
// https://www.timeanddate.com/calendar/repeating.html?year=2100
// https://whencanireusethiscalendar.com/

// we need two functions
// one to determine if a given year is a leap year
// one to calculate the next year in which a calendar repeats

// the rules for a repeating year are:
// if 

ly:mod[;2]sum not mod/:[;4 100 400]::
cr:{x+(s;12)not s:sum 11 11 6 28*ly x+1 2 3 4}

