/**
* A ColdBox Enabled virtual entity service
*/
component extends="coldbox.system.orm.hibernate.VirtualEntityService" singleton{
	
	/**
	* Constructor
	*/
	CarService function init(){
		// init super class
		super.init( entityName="Car" );
	    return this;
	}
	
	public struct function getCarsInsuredForYoungDrivers_Join( required Numeric Age ) {
		var c = newCriteria();
		c.createAlias( "InsuredDrivers", "id" ).isLt( "id.Age", javaCast( "int", arguments.Age ) );
		var results = {
			count = c.count(),
			data = c.list( asquery=true )
		};
		return results;
	}
	public struct function getCarsInsuredForYoungDrivers_Join_Distinct( required Numeric Age ) {
        var c = newCriteria();
        c.createAlias( "InsuredDrivers", "id" )
            .isLt( "id.Age", javaCast( "int", arguments.Age ) )
            .resultTransformer( c.DISTINCT_ROOT_ENTITY );
        var results = {
            data = c.list( asquery=true ),
            count = c.count()
        };
        return results;
    }
    public struct function getCarsInsuredForYoungDrivers_SQL( required Numeric Age ) {
        var c = newCriteria();
        c.sqlRestriction( "CarID in ( select CarID from Insured i join Driver d on i.DriverID=d.DriverID where d.Age < #arguments.Age# )" );
        var results = {
            data = c.list( asquery=true ),
            count = c.count()
        };
        return results;
    }
	public struct function getCarsInsuredForYoungDrivers_SubQuery( required Numeric Age ) {
		var c = newCriteria();
		var s = createObject( "java", "org.hibernate.criterion.Subqueries" );
		var d = createObject( "java", "org.hibernate.criterion.DetachedCriteria" );
		var dc =  d.forEntityName( "Insured", "InsuredDrivers" )
		          .setProjection( c.projections.property( "CarID" ) )
		          .createAlias( "DriverID", "d" )
		          .add( c.restrictions.isLT( "d.Age", javaCast( "int", arguments.Age ) ));
		c.add( s.propertyIn( "CarID", dc ) );
		/*var id = c.createSubquery( "Insured", "InsuredDrivers" );
		id.withProjections( property="CarID");
		id.createAlias( "DriverID", "d" ).add( c.restrictions.isGT( "d.Age", javaCast( "int", arguments.Age ) ) );
		c.add( id.propertyIn( "CarID" ) );*/
		var results = {
            data = c.list( asquery=true ),
            count = c.count()
        };
        return results;
	}
}