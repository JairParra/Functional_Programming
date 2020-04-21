package exam2019;

public class Lower extends Middle{
	
	// fields 
	private int i; 
	private String name; 
	
	// constructors 
	public Lower(int i) { 
		super(i+1); 
		System.out.println("** ^super(i+1) was called^**");
		name = "Lower"; 
		this.i = i; 
		System.out.println("Lower constructor was called"); 
		System.out.println("Lower this.i = " +  this.i);
	}
	
	// getters and setters 
	public void set(Lower n) { 
		i = n.show(); 
		System.out.println("Middle.set called");
		System.out.println("this.i = Lower n.show() = " + n.show());
	}
	
	// methods 
	public int show() { 
		System.out.println("Lower show() was called");
		return i; 
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
