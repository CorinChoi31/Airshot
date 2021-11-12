///@description random_invgauss_range(x1,x2,intensity)
///@function random_invgauss_range(x1,x2,intensity)
///@param x1
///@param x2
///@param intensity
function random_invgauss_range(argument0, argument1, argument2) {

	var v1 = 0;
	var v2 = 0;
	var s = 0;
	var _pm = 0;
	var _returns = 0;

	do
	{
		v1 = random_range(argument0,argument1);
		v2 = random_range(argument0,argument1);
		s = v1 * v1 + v2 * v2;
	} 
	until(s >= 1 or s = 0)

	s = sqrt(abs(ln(s)/s));
	_pm = choose(-1,1);

	if(v1*s*_pm*argument2 < 0)
	{
		_returns = v1*s*_pm*argument2+argument1;
	}
	if(v1*s*_pm*argument2 > 0)
	{
		_returns = v1*s*_pm*argument2+argument0;
	}

	return _returns;


}
