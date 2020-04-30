package exam2019;

public class Upper {

	// Fields
	private int i; 
	private String name; 
	
	// Constructor 
	public Upper(int i) { 
		name = "Upper"; 
		this.i = i; 
		System.out.println("Upper was created");
		System.out.println("Upper this.i=" + this.i);
	}
	
	// Setters and getters 
	public void set(Upper n) { 
		i = n.show(); 
		System.out.println("Upper.set called");
		System.out.println("this.i = Upper n.show() = " + n.show());
	}
	
	public int show() { 
		System.out.println("Upper show() was called");
		return i; 
	}
	
	public static void main(String[] args) {
	}

}
