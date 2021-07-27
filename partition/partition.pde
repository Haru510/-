
void setup(){
  int n = 2 ;
  Player[ ] p = new Player[ n ] ;
  for(int i = 0 ; i < n ; i++ ){
    p[ i ] = new Player( i ) ;
  }
  Coalition c = new Coalition( p ) ;
  println( c ) ;
  ArrayList< CoalitionSet > a = c.getAllPartition() ;
  println( a ) ;
}


  
class Player {
    int index ; //<>//
    Player(int i) {
        this.index = i ; 
    }
    
    String toString() {
        return str(this.index) ; 
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
    
    Coalition( int n ){
      for(int i = 0 ; i < n ; i++){
        this.add(new Player( i )) ;
      }
    }
    
    boolean isDisjoint( Coalition c ) {
      for(int i = 0 ; i < c.size() ; i++){
        for(int j = 0 ; j < this.size() ; j++){
          if(c.get(i) == this.get(j)){
            return false ;
          }
        }
      }
      return true ;
    }  
    
     boolean isSubset( Coalition c ) {  
       boolean b = true ;
       for( int i = 0 ; i < c.size() ; i++ ){
         Player p = c.get( i ) ; 
         b = b && this.contains( p ) ; 
       }
       return b ;
     }

    
      Coalition union( Coalition c ) {
        Coalition a = this.clone() ;
        //Coalition a = new Coalition() ;
        //a = clone() ;
        for( int i = 0 ; i < c.size() ; i++ ){
          if( !(a.contains(c.get(i))) ){
            a.add( c.get( i ) ) ;
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

    

    ArrayList< CoalitionSet > getAllPartition() {
      ArrayList< CoalitionSet > partitions = new ArrayList< CoalitionSet >() ;
      ArrayList< CoalitionSet > base = new ArrayList< CoalitionSet >() ;
      //CoalitionSet a = new CoalitionSet () ;
      base.add( new CoalitionSet () ) ;
      for( int i = 0 ; i < this.size() ; i++ ){
        Player p = this.get( i ) ;
        Coalition c = new Coalition() ;
        c.add( p ) ;
        CoalitionSet b = new CoalitionSet() ;
        b.add( c ) ;
        base.add( b ) ;
        //base.get( i ).add( c ) ;
        if( base.size() == 1 ){
          partitions = base ;
        }
        else{
          for( CoalitionSet g : base ){
            CoalitionSet ocho = g.clone() ;
            ocho.add( c ) ;
            partitions.add( ocho ) ;
            for( int j = 0 ; j < g.size() ; j++ ){
              CoalitionSet diez = g.clone() ;
              diez.get( j ).add( p ) ;
              partitions.add( diez ) ;
            }
          }
        }
      } 
      //for( int i = 0 ; i < this.size() ; i++ ){
      //  Player p = this.get( i ) ;
      //  Coalition c = new Coalition() ;
      //  c.add( p ) ;
      //  CoalitionSet b = new CoalitionSet() ;
      //  b.add( c ) ;
      //  //partitions.add( b ) ;
      //  ab.add( b ) ;
      //  if( this.size() >= 2 ) {
      //    for( CoalitionSet g : ab ){
      //      CoalitionSet uno = g.clone() ;
      //      uno.add( c ) ; 
      //      partitions.add( uno ) ;
      //      for( int j = 0 ; j < g.size() ; j++ ){
      //        CoalitionSet doce = g.clone() ;
      //        doce.get( j ).add( p ) ; 
      //        partitions.add( doce ) ;
      //      }
      //    }
      //  }
        
      //}
      
        //// N = { 0 }の時
        //Coalition c = new Coalition() ;
        //CoalitionSet b = new CoalitionSet() ;
        //c.add( this.get( 0 ) ); 
        //b.add( c ) ;
        //ArrayList< CoalitionSet > base_1 = new ArrayList< CoalitionSet >() ;
        //base_1.add( b ) ;
        
        //////-------------------
        
        ////// N = { 0 , 1 }の時
        //Player p = this.get( 1 ) ;
        //Coalition k = new Coalition( ) ; 
        //k.add( p ) ;
        //ArrayList< CoalitionSet > partition_2 = new ArrayList< CoalitionSet >() ;
        //for( CoalitionSet g : base_1 ){
        //  CoalitionSet uno = g.clone() ;
        //  uno.add( k ) ; // { { 0 }, { 1 } } を表したい
        //  partition_2.add( uno ) ;
        //  for( int i = 0 ; i < g.size() ; i++ ){
        //    CoalitionSet doce = g.clone() ;
        //    doce.get( i ).add( p ) ; // { { 0, 1 } } を表したい
        //    partition_2.add( doce ) ; 
        //  }
        //}
        
        //////-------------------
        
        //////// N = { 0, 1, 2 }の時
        //Player pp = this.get( 2 ) ;
        //Coalition kk = new Coalition( ) ;
        //kk.add( pp ) ;
        //ArrayList< CoalitionSet > base_2 = new ArrayList< CoalitionSet >() ;
        //ArrayList< CoalitionSet > partition_3 = new ArrayList< CoalitionSet >() ;
        //base_2 = partition_2 ;
        //for( CoalitionSet tres : base_2 ){
        //  CoalitionSet a = tres.clone() ;
        //  a.add( kk ) ;
        //  partition_3.add( a ) ;
        //  for( int i = 0 ; i < tres.size() ; i++ ){
        //    CoalitionSet ss = tres.clone() ;
        //    ss.get( i ).add( pp ) ;
        //    partition_3.add( ss ) ;
        //  }
        //}  
        
        //////-------------------
        
        //////// N = { 0, 1, 2, 3 }の時
        //Player u = this.get( 3 ) ;
        //Coalition g = new Coalition( ) ; 
        //g.add( u ) ;
        //ArrayList< CoalitionSet > base_3 = new ArrayList< CoalitionSet >() ;
        //base_3 = partition_3 ;
        //for( CoalitionSet h : base_3 ){
        //  CoalitionSet zero = h.clone() ;
        //  zero.add( g ) ; 
        //  partitions.add( zero ) ;
        //  for( int i = 0 ; i < h.size() ; i++ ){
        //    CoalitionSet siete = h.clone() ;
        //    siete.get( i ).add( u ) ; 
        //    partitions.add( siete ) ; 
        //  }
        //}
    
      return base ;
            
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

class CoalitionSet extends ArrayList< Coalition > {
  
  CoalitionSet() {
  }
  
  CoalitionSet clone() {
    CoalitionSet x = new CoalitionSet() ;
    for( Coalition z : this ){
      x.add( z.clone() ) ;
    }
    return x ;
    
    //CoalitionSet x = new CoalitionSet() ;
    //for( int i = 0 ; i < this.size() ; i++ ){
    //  x.add( this.get( i ).clone( ) ) ;
    //}
    //return x ;
  }
  
  //boolean isPartitionOf( Coalition c ) {
  //  if( c.size() == 0 ){
  //    return false ;
  //  }
  //  if( ! isDisjoint( c ) ){
  //    return false ;
  //  }
  //  boolean x = false ;
  //  for( int i = 0 ; i < c.size() ; i++ ){
  //    for( int j = 0 ; j < this.size() ; j++ ){
  //      Player a = c.get( i ) ;
  //      if( a == this.get( j ) ){
  //        x = true ;
  //      }
  //    }
  //  }
    
    //for(int i = 0 ; i < c.size() ; i++){
    //  Player a = c.get( i ) ;
    //  for(int j = 0 ; j < c.size() ; j++){
    //    if( a == c.get( j ) ){
    //      x = true ;
    //      break ;
    //    }
    //  }
    //  if( ! x ){
    //    return false ;
    //  }
    //}
    //return true ;
  }
  
  //boolean isFiner(CoalitionSet cs) {

  
//    }
