
void setup(){
 
}
  
class Player {
    int index ; //<>//
    Player(int i) {
        this.index = i ; 
    }
    
    String toString() {
        return this.str(i) ; 
    }
}

class Coalition extends ArrayList<Player> {
    Coalition(Player[] ps) {
        for (Player p : ps) {
            this.add(p) ;
        }
    }
    
    Coalition(){
      
    }
    
    boolean isDisjoint(Coalition c) {
      for(int i = 0 ; i < c.size() ; i++){
        for(int j = 0 ; j < this.size() ; j++){
          if(c.get(i) == this.get(j)){
            return false ;
          }
        }
      }
       return true;
    }  

    
     boolean isSubset(Coalition c) {  
       boolean b = true ;
       for(int i = 0 ; i < c.size() ; i++){
         Player p = c.get(i) ; 
         b = b && this.contains(p) ; 
       }
       return b ;
     }

    
      Coalition union(Coalition c) {
        Coalition a = this.clone() ;
        //Coalition a = new Coalition() ;
        //a = clone() ;
        for(int i = 0 ; i < c.size() ; i++){
          if(!(a.contains(c.get(i)))){
            a.add(c.get(i)) ;
          }
        }
        
        return a ;
        
      //  for(int i = 0 ; i < c.size() ; i++){
      //    if(!(this.contains(c.get(i)))){
      //      a.add(c.get(i)) ;
      //      //put the "c" that was not included in "this" into "this".;
      //    }
      //  }
      //  for(int j = 0 ; j < this.size() ; j++){
      //    a.add(this.get(j)) ;
      //  }
      //  return a ;
      }

    

    ArrayList<CoalitionSet> getAllPartition() {
      ArrayList<CoalitionSet> partitions = new ArrayList<CoalitionSet>() ;
        //CoalitionSet b = new CoalitionSet() ;
  
      if( this.size() == 1 ){
        CoalitionSet b = new CoalitionSet() ;
        b.add(this) ;
        partitions.add(b);
      }
      else{
        Coalition x = new Coalition() ;
        CoalitionSet y = new CoalitionSet() ;
        for(int i = 0 ; i < this.size() ; i++ ){
          x.add(this.get(i));
          y.add(x.clone()) ;
          partitions.add(y) ;
        }
        
      }  
      
      return partitions ;
            
        //else{
        //  Coalition a = new Coalition() ;
        //  CoalitionSet b = new CoalitionSet() ;
        //  CoalitionSet c = new CoalitionSet() ;
        //  for(int i = 0 ; i < this.size() ; i++){
        //    a.add(this.get(i)) ;
        //    b.add(a) ;
        //    partitions.add(b) ;
        //  }
        //  c.add(this) ;
        //  partitions.add(c) ;
          
        //}
    }

    String toString() {
        String[] s = new String[this.size()] ;
        for (int i = 0 ; i < this.size() ; i++) {
          s[i] = this.get(i).toString() ;            
        }
        return "{ " + join(s, ", ") + " }" ;
    }
    
    Coalition clone() {
      Coalition w = new Coalition() ;
      for(int i = 0 ; i < this.size() ; i++){
        w.add(this.get(i)) ;
      }
      return w ;
      //return new Coalition(this.toArray()) ;
    }
}

class CoalitionSet extends ArrayList<Coalition> {
  
  CoalitionSet() {
  }
  
  boolean isPartitionOf(Coalition c) {

  }
  boolean isFiner(CoalitionSet cs) {

  
  }
}
