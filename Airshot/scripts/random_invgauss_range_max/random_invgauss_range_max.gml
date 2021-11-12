///@description random_invgauss_range_max(x1,x2,intensity)
///@function random_invgauss_range_max(x1,x2,intensity)
///@param x1
///@param x2
///@param intensity
function random_invgauss_range_max(argument0, argument1, argument2) {

	var v1 = 0;
	var v2 = 0;
	var s = 0;
	var _pm = 0;
	var _returns = 0;
	var big = 0;

	do
	{
		v1 = random_range(argument0,argument1);
		v2 = random_range(argument0,argument1);
		s = v1 * v1 + v2 * v2;
	} 
	until(s >= 1 or s = 0)

	s = sqrt(abs(ln(s)/s));
	_pm = choose(-1,1);
	big = max(v1,v2);
	if(big*s*_pm*argument2 < 0)
	{
		_returns = big*s*_pm*argument2+max(argument0,argument1);
	}
	if(big*s*_pm*argument2 > 0)
	{
		_returns = big*s*_pm*argument2-max(argument0,argument1);
	}

	return _returns;


}
