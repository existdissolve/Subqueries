component displayName="Car" {
    property name="CarService" inject;
    
    public any function index() {
    	var results = CarService.getCarsInsuredForYoungDrivers_Join( 26 );
    	var results2 = CarService.getCarsInsuredForYoungDrivers_Join_Distinct( 26 );
    	var results4 = CarService.getCarsInsuredForYoungDrivers_SQL( 26 );
    	var results3 = CarService.getCarsInsuredForYoungDrivers_Subquery( 26 );
    	writedump( results2 );
    	abort;
    }
}