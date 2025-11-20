@IsTest
public class MyIterableTest {
    @IsTest
    public static void testIterableForLoop() {
        // Step 1: Prepare data
        List<String> strings = new List<String>{'Hello', 'World'};

        // Step 2: Pass data to your iterable class
        MyIterable myIterable = new MyIterable(strings);

        // Step 3: Use a for loop to iterate
        for (String str : myIterable) {
            System.debug(str);
        }

        // Step 4: Validate with assertions
        List<String> expectedStrings = new List<String>{'Hello', 'World'};
        List<String> actualStrings = new List<String>();

        for (String str : myIterable) {
            actualStrings.add(str);
        }

        System.assertEquals(expectedStrings, actualStrings, 'The iteration did not return expected results');
    }
}