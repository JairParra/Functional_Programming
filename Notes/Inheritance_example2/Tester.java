package exam2019;

public class Tester {

	public static void main(String[] args) {
		
		System.out.println("*****************************");
		System.out.println("Lower a");
		Lower a = new Lower(1); // create ab object of type Lower
		
		System.out.println("*******************************");
		
		System.out.println("Middle b = a"); 
		Middle b = a; 
		
		System.out.println("*******************************");
		
		System.out.println("Upper c = new Middle(5)");
		Upper c = new Middle(5); 
		
		System.out.println("*******************************");
		
		System.out.println("a.show(): " + a.show()); // 1
		System.out.println("b.show(): " + b.show()); // 1
		System.out.println("c.show(): " + c.show()); // 5 
		
		System.out.println("*******************************");

		a.set(c); 
		System.out.println("*******************************");

		b.set(a); // should set, but has the same value 
//		b.set(a2); // still remains unchanged? 
		System.out.println("*******************************");

		c.set(b); 
		
		System.out.println("*******************************");
		
		System.out.println("a.show(): " + a.show());
		System.out.println("b.show(): " + b.show());
		System.out.println("c.show(): " + c.show());

	}

}
