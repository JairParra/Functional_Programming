package subtyping;

class gaussInt extends myInt { 
	// Instance variable
	private int m; // Represents the imaginary part 
	
	/* We do not need the real part that is already present 
	   because we have inherited all the data and methods of 
	   myInt. Thus the private int n is also present in every
	   instance of a gaussInt. */ 
	   
	  // Constructor 
	  public gaussInt(int x, int y){ 
	  	super(x); // Special keyword to call the superclass constructor
	  	this.m = y; 	  
	  }
	  
	  // Instance methods 
	  
	  //This method is overriden from the superclass 
	  public void show(){ 
	  	System.out.println(
	  	"realpart is: " + this.getval() + " imagpart is: " + m); 	  
	  }
	  
	  public int realpart(){ 
	  	return getval(); // inherited from myInt 	  
	  }
	  
	  public int imagpart() {
		 return this.m;  
	  }
	  
	  /*The method getval is defined in the superclass. It is not defined here, 
	  but it is inherited by this class so we can use it. */ 
	  
	  // This is an overloaded method 
	  public gaussInt add(gaussInt z){ 
	  	int newrealpart = z.realpart() + this.realpart(); 
	  	int newimagpart = z.imagpart() + this.imagpart(); 
	  	return new gaussInt(newrealpart, newimagpart); 
	  }
	  
	  public static void main(String[] args){ 
		  
		  System.out.println("Kreimhilde");
		  gaussInt kreimhilde = new gaussInt(3,4); 
		  kreimhilde.show(); // Will use the overriden method
		  kreimhilde.increment(2); // Will use method from myInt
		  kreimhilde.show(); 
		  
		  
		  System.out.println("Now we watch the subtleties of overloading"); 
		  myInt a = new myInt(3); 
		  gaussInt z = new gaussInt(3,4); 
		  gaussInt w; // no object has been created 
		  myInt b = z; // b and z are names for the same object 
		  // even though b and z refer to the SAME object, they have 
		  // different types 
		  
		  System.out.println("the value of z is: " ); 
		  z.show();
		  System.out.println("the value of b is: " );
		  b.show();
		  // which method will be used? 
		  
		  myInt d = b.add(b); // this does type check 
		  System.out.print("the value of d is: ");
		  d.show(); 
		  // w = z.add(b); // will not type check 
		  // w = b.add(z); // will not type check 
		  w = ( (gaussInt) b).add(z); // this does typecheck 
		  System.out.println("the value of w is: " ) ;
		  w.show();
		  myInt c = z.add(a); // will this typecheck? 
		  System.out.print("the value of c is: " );
		  c.show();
	
	  }
		
} // class gaussInt
