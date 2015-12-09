import java.util.HashMap;
import java.util.Scanner;
import java.util.StringTokenizer;
import java.util.TreeSet;
import java.util.stream.Collectors;

public class MissingNumbers {

	public static void main(String[] args) {
		try(Scanner s = new Scanner(System.in)) {
			int amountA = s.nextInt();
			s.nextLine();
			if(amountA < 1 || amountA > 1000010) throw new RuntimeException("Error amount in list A");
			String nextLineA = s.nextLine();
			int amountB = s.nextInt();
			s.nextLine();
			if(amountB < 1 || amountB > 1000010) throw new RuntimeException("Error amount in list A");
			String nextLineB = s.nextLine();
			HashMap<String,Listing> hash = new HashMap<String,Listing>();
			StringTokenizer stringTokenizerA = new StringTokenizer(nextLineA, " ");
			while(stringTokenizerA.hasMoreElements()){
				String strNumber = (String) stringTokenizerA.nextElement();
				Listing listing = hash.get(strNumber);
				if(listing == null){
					listing = new Listing();
				}
				listing.amountA += 1;
				hash.put(strNumber, listing);
			}
			StringTokenizer stringTokenizerB = new StringTokenizer(nextLineB, " ");
			while(stringTokenizerB.hasMoreElements()){
				String strNumber = (String) stringTokenizerB.nextElement();
				Listing listing = hash.get(strNumber);
				if(listing == null){
					listing = new Listing();
				}
				listing.amountB += 1;
				hash.put(strNumber, listing);
			}
			TreeSet<Integer> missings = new TreeSet<Integer>();
			hash.forEach(
					(number,listing) -> {
					if(listing.amountA < listing.amountB){
						missings.add(Integer.parseInt(number));
					}
				}
			);
			System.out.println(missings.stream().map(Object::toString).collect(Collectors.joining(" ")));
		}
	}

	private static class Listing{
		int amountA = 0;
		int amountB = 0;
	}

}
