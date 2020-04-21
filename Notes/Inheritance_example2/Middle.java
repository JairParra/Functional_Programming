package exam2019;

public class Middle extends Upper{
	
	// fields 
	private int j ; 
	private String name; 
	
	// constructor
	public Middle(int i) { 
		super(i+1); 
		System.out.println("** ^Called super(i+1)^ **");
		name = "Middle"; 
		this.j = i; 
		System.out.println("Middle constructor called"); 
		System.out.println("Middle this.j = " + this.j);
	}
	
	// setters and getters
	public void set(Upper n) { 
		this.j = n.show(); 
		System.out.println("Middle.set called");
		System.out.println("this.j = Upper n.show() = " + n.show() );
	}
	
	// methods 
	public int show() { 
		System.out.println("Middle show() was called");
		return j; 
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
