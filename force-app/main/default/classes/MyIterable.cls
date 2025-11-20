public class MyIterable implements Iterable<String> {
    private List<String> strings;

    // Constructor accepts a list of strings
    public MyIterable(List<String> strings) {
        this.strings = strings;
    }

    // Mandatory method for Iterable interface
    public Iterator<String> iterator() {
        return strings.iterator(); // Native list iterator
    }
}