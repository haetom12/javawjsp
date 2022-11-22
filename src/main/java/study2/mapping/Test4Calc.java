package study2.mapping;

public class Test4Calc {
	public int getCalc(int su1, String opt, int su2) {
		int res = 0;
		if(opt.equals("+")) res = su1 + su2;
		else if(opt.equals("-")) res = su1 - su2;
		else if(opt.equals("*")) res = su1 * su2;
		else if(opt.equals("/")) res = su1 / su2;
		else res = su1 % su2;
		
		return res;
	}
}
