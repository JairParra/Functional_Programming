package subtyping;

class myInt { 
	// Instance variable 
	private int n; 
	
	// Constructor 
	public myInt(int n){ 
		this.n = n; 
	} 
	
	// Instance methods 
	public int getval(){ 
		return n; 	
	}
	
	public void increment(int n){ 
		this.n += n; 	
	}
	
	public myInt add(myInt N){ 
		return new myInt(this.n + N.getval()); 	
	}
	
	public void show(){ 
		System.out.println(n); 	
	}
	
	public static void main(String[] args) { 
		System.out.println("Some stuff");
	}
}