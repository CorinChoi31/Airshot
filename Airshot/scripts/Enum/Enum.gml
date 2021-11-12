function Enum() {
	enum BUFF
	{
		//
		SEARCH_EXISTS = 4,
	
		SEARCH_LESS = -2,
		SEARCH_LESSorSAME = -1,
		SEARCH_SAME = 0,
		SEARCH_MOREorSAME = 1,
		SEARCH_MORE = 2,
		SEARCH_NOT = -4,
	
		//
		SEARCH_AMOUNT = 1,
		SEARCH_BOTH = 0,
		SEARCH_TICK = -1,
	
		SEARCH_USER = 2,
		SEARCH_TAG = 3,
	
		//
		REPLACE_AMOUNT = 1,
		REPLACE_BOTH = 0,
		REPLACE_TICK = -1,
	
		REPLACE_ALL = 0,
		REPLACE_SINGLE = 1
	}

	enum EFFECT
	{
		DEFAULT_untouchable,
		DEFAULT_unstoppable,
	
		HEALTH_max,
	
		SPEED_max,
		SPEED_accel,
	
		SPEED_max_constant,
	
		DAMAGE_Send_ratio,
		DAMAGE_Recive_ratio,
	
		ATTACK_damage,
		ATTACK_speed,
	
		ATTACK_Bullet_speed,
		ATTACK_Bullet_duration,
		ATTACK_Bullet_amountmax,
		ATTACK_Bullet_reload,
	
		ATTACK_range,
	
		SKILL_cool,
	
	
		PASSIVE_reload,
	
		PASSIVE_revive,
	
		PASSIVE_speedmax,
		PASSIVE_speedmax_attack,
		PASSIVE_speedmax_damage,
	
		PASSIVE_untouchable,
	
		PASSIVE_skillcool,
	
		PASSIVE_Shell_trace,
		PASSIVE_Missile_trace,
	
		PASSIVE_ignite,
	
		PASSIVE_Health_max,
		PASSIVE_Attack_damage,
	
		PASSIVE_hide,
	
		PASSIVE_heavyequip,
	
		PASSIVE_weakness_give,
		PASSIVE_weakness,
	
	
		ACTIVE_Heal_instant,
		ACTIVE_Heal_regeneration,
	
		ACTIVE_countdown,
	
		ACTIVE_bombard,
	
		ACTIVE_lazer,
		ACTIVE_lazer_shot,
		ACTIVE_reset,
	
		ACTIVE_Shell_curtaincall,
		ACTIVE_Shell_fire,
		ACTIVE_Shell_piercing,
	
		ACTIVE_rage,
	
		ACTIVE_impulse,
	
		ACTIVE_Missile_freeze,
	
		ACTIVE_dimensionjump,
		ACTIVE_dimensionjump_debuff,
	
		ACTIVE_fixbydamage,
	
		ACTIVE_timerewind,
		ACTIVE_timerewind_record,
	
		ACTIVE_energy_fire,
	
		HIDDEN_Heartstone,
	}

	enum PART
	{
		SQUARE = 0,
		ECLIPSE = 1,
	
		DEFAULT = 0,
		GAUSSIAN = 1,
		INVERSE_GAUSSIAN = 2
	}



}
