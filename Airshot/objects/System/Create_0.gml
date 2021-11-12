randomize();
draw_set_circle_precision(48);

global.tick = 0;

global.camera = instance_create_depth(0,0,0,Camera);
global.partIns = instance_create_depth(0,0,0,Particle);

global.player_first = noone;
global.player_second = noone;

global.menu = 0;

global.game_version = "1.13 v"
global.game_running = 0;
global.game_result = 0;

global.patch_title = "조작법"//"패치노트 "+global.game_version;
global.patch_context = "";
/*
global.patch_context = "보조 기술 :\n"+
						"  [나노 추적탄|신규!]\n"+
						"  [추격|피해량 5% 및 둔화량 1% 감소, 둔화 지속시간 0.5초 증가]\n\n"+
						"주 기술 :\n"+
						"  [커튼콜|조건부 자동조준의 필요 각도가 2.5도로 감소]\n"+
						"  [충격파|신규!]\n\n"+
						"신규 전장 효과!\n"
*/
						

global.game_score = 0;
global.game_first_score = 0;
global.game_second_score = 0;

global.airframe_information = 0;
//		"체력","기체 속력","기체 공격력","기체 공격속도","탄알 속력","탄알 지속시간","탄창 크기","재장전 대기시간","조준 사거리,"다중 발사","탄퍼짐"
global.airframe_information[0] =	[240	,7		,6		,8		,20		,7		,16		,2		,0.9	,1		,3];
global.airframe_information[1] =	[192	,6.5	,12		,4		,24		,10		,5		,1		,1		,1		,2.5];
global.airframe_information[2] =	[180	,7.5	,16		,2		,28		,8		,4		,1.5	,1.1	,1		,1];
global.airframe_information[3] =	[120	,5		,24		,1.75	,42		,6		,10		,3		,1.25	,1		,0];
global.airframe_information[4] =	[160	,5.5	,8		,1		,36		,1.75	,16		,2.5	,0.75	,8		,17.5];
global.airframe_information[5] =	[200	,8		,2		,10		,48		,1		,2		,0.1	,0.4	,2		,15];

graph_max =							[240	,8		,24		,10		,48		,10		,16		,3		,1.25	,8		,17.5];

partEmit = part_emitter_create(global.partSys);

menuNext = -1;
menuTick = 0;
menuChangeTick = 0;
menuChangeTick_Value = room_speed/2;

menuAlpha = 1;
menuAlpha_Draw = 0;
menuAlpha_Speed = room_speed/10;
menuSubAlpha = 1;
menuSubAlpha_Draw = 0;
menuSubAlpha_Speed = room_speed/5;

menu_page_first = 0;
menu_page_second = 0;

cursor_first = 0;
cursor_accept_first = 0;
graph_first = [0,0,0,0,0,0,0,0,0,0,0];
global.keyboard_assgin_first = [ord("D"),ord("W"),ord("A"),ord("S"),ord("G"),ord("H"),ord("J"),vk_control];
cursor_second = 0;
cursor_accept_second = 0;
graph_second = [0,0,0,0,0,0,0,0,0,0,0];
global.keyboard_assgin_second = [vk_right,vk_up,vk_left,vk_down,vk_numpad5,vk_numpad6,vk_numpad9,vk_numpad0];

first_af_id = 0;
first_ps_id = 0;
first_as_id = 0;

second_af_id = 0;
second_ps_id = 0;
second_as_id = 0;

room_size_id = 0;
room_effect_id = 0;

graph_list = ["내구도","기체 속력","기체 공격력","기체 공격속도","탄알 속력","탄알 지속시간","탄창 크기","재장전 대기시간","조준 사거리","다중 발사","탄퍼짐"];

room_size = ["4800","5200","6400","8400","9600","10800","12000"];
room_type = ["없음","+지역 효과"]//,"+보급품 효과","+혼합 효과"];
room_types = 0;

room_effect = noone;
room_effect_tick = 0;
room_effect_tick_cool = room_speed*30;

airframes = ds_list_create();
ds_list_add(airframes,"F-MG","P-RL","H-MP","A-SR","H-SG","R-PL");

skill_description_draw_first = "";
skill_description_draw_first_cool = "";
skill_description_draw_second = "";
skill_description_draw_second_cool = "";

skill_passives = ds_list_create();
ds_list_add(skill_passives,"없음","신호탄","소이탄","재빠른 손놀림","부상","단거리 주자","시간차 공격","편안함","도주","완벽한 타이밍","추격","추적 미사일","발화제","자가수리 v2","유리 대포","은폐","중장갑 장비","약점 포착");
skill_passives_description = ds_list_create();
ds_list_add(skill_passives_description,"",
	"최초 1회에 한해, 내 기체가 발사한 탄알이 벽에 부딪히면 다시 적을 향하며 판정 범위가 4배로 증가합니다. 이후 벽에 부딪힐 때마다 판정 너비가 10% 증가합니다.",
	"내 기체가 발사한 탄알이 제거될 때 폭발합니다. 폭발 시 주위에 탄알 피해량의 50%([ATK|0.5]) 만큼 피해를 줍니다. 이 피해는 자신도 받을 수 있습니다.",
	"내 기체의 재장전 시간이 80%(-[RELOAD|0.80]) 감소합니다.",
	"내 기체가 파손에 이르는 피해를 받으면 그 피해를 무시하고 2초간 피해 면역 상태가 됩니다. 또한 지속시간 동안 내 기체의 최대 내구도의 25%(+[HP|0.25]) 만큼 내 기체를 수리합니다. 16초 이후 재활성화 됩니다.",
	"내 탄알의 속력이 100%(+[BULLET_SPEED|1]) 증가하지만, 탄알의 피해량이 1초 뒤 부터 점점 감소하여 4초 뒤에는 25%([ATK|0.25]) 만큼의 피해만을 줍니다.",
	"내 탄알의 피해량이 25%(-[ATK|0.25]) 감소하지만, 한 탄약으로 2발의 탄알을 발사할 수 있습니다. 두 탄알 중 한 탄알의 속력이 25%(-[BULLET_SPEED|0.25]) 감소합니다.",
	"내 기체가 3초간 피해를 받지 않으면 다음 1회 한정으로 피해를 무시하며 2초간 받는 피해가 25% 감소하고 이동속도가 10% 상승합니다.",
	"내 기체의 속력이 2%(+[SPEED|0.02]) 상승합니다. 적에게 탄알로 피해를 주거나 피해를 받으면 추가적으로 2%(+[SPEED|0.02]) 상승합니다. 각각 20%(+[SPEED|0.2]), 10%(+[SPEED|0.1])까지 추가로 상승하여, 최대 32%(+[SPEED|0.32])까지 상승할 수 있습니다.",
	"내 기술의 재사용 대기시간이 40% 감소합니다. 내가 기술을 시전하면 1초간 피해 면역 상태가 됩니다.",
	"내 탄알이 적에게 4번 적중되면, 각각 공격력의 10%([ATK|0.10]) 만큼의 피해를 주며 2초간 기체 속력을 2% 감소시키는 탄환 10개를 발사합니다.",
	"내 탄알이 적에게 3번 적중되면, 적을 추격하며 6초 동안 유지되는 미사일을 2발 발사합니다. 폭발 시, 주위에 공격력의 55%([ATK|0.55]) 만큼 피해를 줍니다.",
	"내가 탄알로 적에게 피해를 주면 적 기체에 불을 붙입니다. 불은 4초간 유지되며 이 동안 피해량이 점점 상승하여 매 초마다 최대 공격력의 40%([ATK|0.40]) 만큼 피해를 줍니다. 불이 유지되는 동안 탄알을 다시 적중시키면 불의 지속시간이 초기화되면서 현재 피해량 만큼 추가피해를 입히며 피해량이 강화됩니다.",
	"내 손상 수리 속도가 300% 증가합니다.",
	"내 기체의 공격력이 50%(+[ATK|0.50]) 상승하지만 내구도가 20% 감소하고 기술을 사용하면 5초간 받는 피해량이 30% 상승합니다.",
	"내 기체가 2.5초간 공격받거나 공격하지 않으면 이동속도가 5% 상승합니다. 잃은 체력%에 비례하여 최대 50% 까지 상승합니다.",
	"내 기체 내구도가 40%, 공격력이 20% 증가하지만 이동속도가 10%, 공격속도가 20% 감소합니다.",
	"적 기체에 10초마다 2.5초간 유지되는 약점을 부여합니다. 약점이 있는 적을 공격하면 5초 동안 대상이 받는 피해가 25% 상승하고 다음 약점을 부여하는 시간이 50% 감소합니다."
)

skill_actives = ds_list_create();
ds_list_add(skill_actives,"없음","초읽기","탄약 확충","미사일 폭격","재설정","방어 강화","대장갑 탄환","철갑유탄","가속","최적화","난사","충격파","빙결 미사일","차원 도약","재생","시간 역행","위상 분열포","역장 발생기");//"무작위 기술"
skill_actives_description = ds_list_create();
ds_list_add(skill_actives_description,"[COOLDOWN|0]",
	"[COOLDOWN|21]1.5초간 사거리 내의 적 기체와 적의 탄알, 탄환, 미사일의 속력이 지속적으로 감소합니다.",
	"[COOLDOWN|16]8초간 내 기체의 재장전 시간이 75%(-[RELOAD|0.75]) 감소하고, 공격속도가 25%(+[ATK_SPEED|0.25]) 상승합니다.",
	"[COOLDOWN|20]1.5초 뒤에 내 기체 공격력의 10%([ATK|0.1])의 피해를 주는 미사일 64발을 16번에 나눠서 발사합니다. 모두 적중 시, 공격력의 640%([ATK|6.4])의 피해를 입습니다. 미사일은 3초간 유지됩니다.",
	"[COOLDOWN|26]1초 뒤에, 적의 탄알을 내 탄알로 변경하고 피해량을 25% 상승시킵니다. 이후 내 모든 탄알을 적에게 향하게 합니다. 경로가 바뀐 탄알의 속력이 50% 상승합니다.",
	"[COOLDOWN|18]1초간 받는 피해가 100% 감소하고, 이후 3초간 내 기체가 받는 피해가 75% 감소합니다.",
	"[COOLDOWN|22]12초 동안 4번의 일반공격이 탄환을 사용하는 대신 이동속도가 감소합니다. 이 탄환은 탄알의 400%([BULLET_SPEED|4])의 속력으로 적에게 공격력의 150%([ATK|1.5]) 만큼 피해를 주며 1초간 지속됩니다. 발사할 때마다 강화되어 내 잃은체력의 15%에 해당하는 피해를 추가로 입힙니다. 마지막 탄환은 피해량이 2배로 상승합니다. 수동으로 조준해야 합니다.",
	"[COOLDOWN|20]1초 뒤에, 적에게 향하는 탄환을 12발 발사합니다. 이 탄환은 적에게 공격력의 100%([ATK|1]) 만큼 피해를 주며 6초간 지속됩니다. 이 탄환은 장애물을 무시합니다.",
	"[COOLDOWN|16]내 기체의 이동속도가 25%(+[SPEED|0.25]), 탄알 속력이 50%(+[BULLET_SPEED|0.50]), 조준 사거리가 50% 상승합니다. 효과는 4초간 유지됩니다.",
	"[COOLDOWN|18]내 기체의 이동속도가 10%(+[SPEED|0.10]) 증가하고, 공격속도가 50%(+[ATK_SPEED|0.5]), 공격력이 25%(+[ATK|0.25]) 증가합니다. 효과는 6초간 유지됩니다.",
	"[COOLDOWN|26]0.75초 뒤에, 적에게 공격력의 50%([ATK|0.50]) 만큼 피해를 주는 탄알을 60발 발사합니다. 탄퍼짐이 적용되며 탄알의 속력이 50%(+[BULLET_SPEED|0.5]) 상승합니다. 이 공격 도중에는 수동으로 조준해야 하며 이동속도가 크게 감소합니다.",
	"[COOLDOWN|24]1초 뒤에, 내 기체 사거리 1.5배 내의 투사체를 느리게 합니다. 또한 사거리 내에 적 기체가 있다면 탄창을 비우고 주 기술 시전을 3초간 차단하며 속력을 50% 감소시킵니다.",
	"[COOLDOWN|14]0.5초 뒤에, 미사일을 3발 발사합니다. 이 미사일은 적을 추격하며 5초 동안 유지됩니다. 폭발 시, 주위에 공격력의 75%([ATK|0.75])의 피해를 주고 3초간 기체의 속력을 25% 감소시킵니다.",
	"[COOLDOWN|4]0.1초 뒤에, 짧은 거리를 점멸합니다. 기술 시전에 실패하면 재사용 대기시간을 20% 돌려받습니다.",
	"[COOLDOWN|30]10초간 내가 적에게 피해를 주면 입힌 피해의 50% 만큼 내구도를 수리합니다.",
	"[COOLDOWN|26]즉시 내 시간을 되돌려, 내 기체의 위치와 내구도, 탄창이 3초 전의 상태로 돌아갑니다.",
	"[COOLDOWN|14]잠시 뒤, 레이저를 세 번 발사합니다. 레이저는 회당 2회, 각각 공격력의 25%([ATK|0.25]), 50%([ATK|0.50]), 100%([ATK|1])의 피해를 입히는 대신 수동으로 조준해야 합니다. 공격 적중 시, 각각 1회의 탄알공격으로 인정됩니다.",
	"[COOLDOWN|18]1초의 충전을 하여 탄환을 발사합니다. 이 탄환은 6초간 유지되며 근처의 적 기체의 속력을 60% 감소시키고 모든 탄알, 탄환, 미사일의 속력이 지속적으로 감소합니다. 적 기체에 부딪히면 공격력의 100%([ATK|1])의 피해를 주며 2초간 속력을 100% 감소시킵니다. 수동으로 조준해야 합니다.",
	//"[COOLDOWN|10]내 기술이 무작위로 선택되어 발동됩니다."
);