import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class SolutionSimilar {

	public static void main(String[] args) {
		try(Scanner s = new Scanner(System.in)) {
			int amount = s.nextInt();
			s.nextLine();
			for (int i = 0; i < amount; i++) {
				List<Integer> wordsCount = new ArrayList<Integer>();
				String word = s.nextLine();
				for (int j = 0; j < word.length(); j++) {
					String substring = word.substring(j,word.length());
					Integer count = countSimilary(word, substring);
					wordsCount.add(count);
				}
				System.out.println(wordsCount.stream().reduce(0, (sum, p) -> sum + p));
			}
		}
	}

	private static Integer countSimilary(String word, String cmpWord) {
		int sum = 0;
		boolean match = false;
		int index = cmpWord.length();
		while(!match && index >= 0){
			String cmp = cmpWord.substring(0,index);
			match = cmp.equalsIgnoreCase(word.substring(0, index));
			if(match){
				sum = index;
			}
			index--;
		}
		return sum;
	}

}
