component displayName="Car" {
    property name="CarService" inject;
    
    public any function index() {
    	event.setView('select');
    }
    public any function test1(event,rc,prc) {
    	prc.title = "Regular Join";
    	prc.results = CarService.getCarsInsuredForYoungDrivers_Join( 26 );
    	event.setView('results');
    }
    public any function test2(event,rc,prc) {
    	prc.title = "Join with ResultTransformer";
        prc.results = CarService.getCarsInsuredForYoungDrivers_Join_Distinct( 26 );
        event.setView('results');
    }
    public any function test3(event,rc,prc) {
    	prc.title = 'SQL Restriction';
        prc.results = CarService.getCarsInsuredForYoungDrivers_SQL( 26 );
        event.setView('results');
    }
    public any function test4(event,rc,prc) {
    	prc.title = 'Subquery';
        prc.results = CarService.getCarsInsuredForYoungDrivers_Subquery( 26 );
        event.setView('results');
    }
}