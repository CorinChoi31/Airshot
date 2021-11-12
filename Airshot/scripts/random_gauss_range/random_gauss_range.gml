///@description random_gauss_range(x1,x2,intensity)
///@function random_gauss_range(x1,x2,intensity)
///@param x1
///@param x2
///@param intensity
function random_gauss_range(argument0, argument1, argument2) {

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

	_returns = v1*s*argument2;

	return _returns;


}
