// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function DataInit(){
	
	if(file_exists("Save.sav") and !file_exists("SaveData.sav")) MapDataRead()

	if(file_exists("SaveData.sav")) JsonDataLoad()
	else							JsonDataSave()
	
};

function MapDataRead(){
	var _map  = ds_map_secure_load("Save.sav")
	var _comp = false;
	
	if(_map != -1)
	{
		var _ver  = _map[? "Ver"];
		
	
		if(!is_undefined(_ver))
		{
			var _strsize = string_length(_ver)
			var _tempver;
			
			if(_strsize > 5) _tempver = string_copy(_ver, 1, _strsize - 2)
			else			 _tempver = _ver
			
			var i;
			for(i = 0; i < 20; i++)
			{
				if(string(_tempver) == Compatible[i])
				{
					_comp = true
					break;
				}
			}
		}
	}
	
	if(_map == -1 or !_comp)
	{
		LoadError = true
		file_delete("Save.sav")
		exit
	}
	
	var _opt = _map[? "Options"]
	var _cbt = _map[? "Buttons"]
	var _scr = _map[? "Scores"]
	
	var i;
	for(i = 0; i < ds_list_size(_opt); i++)
	{
		Options[i] = _opt[| i]
		
		if(i < ds_list_size(_cbt)) CurrentButtons[i] = _cbt[| i]
	}
	
	//for(i = 0; i < ds_list_size(_scr); i++) Scores[i] = _scr[| i]
	
	if(!(string_digits(_ver) < string_digits("1.1.0"))) for(i = 0; i < ds_list_size(_scr); i++) Scores[i] = _scr[| i]
	else
	{
		for(i = 0; i < 45; i++) Scores[i] = _scr[| i]
		for(i = 0; i < 7; i++)  Scores[105 +i] = _scr[| 45 + i]
	}
	
	audio_master_gain(Options[8]/100)
	
	ds_map_destroy(_map)
	ds_list_destroy(_opt)
	ds_list_destroy(_cbt)
	ds_list_destroy(_scr)
//	ds_list_destroy(_gpd)
	
	switch(Options[2])
	{
		case 0: LanFile = "ENG_Text.ini"; break;
		case 1:	LanFile = "ESP_Text.ini"; break;
		case 2: LanFile = "VIE_Text.ini"; break;
						
		default:
			LanFile = "ENG_Text.ini"
			break;
	}
	
	file_delete("Save.sav")
};

function MapDataSave(){
	var _map = ds_map_secure_load("Save.sav")
	
	ds_map_replace(_map,"Options", Options)
	ds_map_replace(_map,"Buttons", CurrentButtons)
	ds_map_replace(_map,"GamePad", CurJPadButtons)
	ds_map_replace(_map,"Scores",  Scores)
	ds_map_replace(_map,"Ver",	   GM_version)
	
	ds_map_secure_save(_map,"Save.sav")
	ds_map_destroy(_map)
};

function LanTextLoad(){
	ini_open(LanFile)
	
	#region Main Text
		Text[0,0] = ini_read_string("Text", "Texto[0,0]","None")
		Text[0,1] = ini_read_string("Text", "Texto[0,1]","None")
		Text[0,2] = ini_read_string("Text", "Texto[0,2]","None")
		Text[0,3] = ini_read_string("Text", "Texto[0,3]","None")
		Text[0,4] = ini_read_string("Text", "Texto[0,4]","None")
		Text[0,5] = ini_read_string("Text", "Texto[0,5]","None")
	
		Text[1,0] = ini_read_string("Text", "Texto[1,0]","None")
		Text[1,1] = ini_read_string("Text", "Texto[1,1]","None")
		Text[1,2] = ini_read_string("Text", "Texto[1,2]","None")
		Text[1,3] = ini_read_string("Text", "Texto[1,3]","None")
		Text[1,4] = ini_read_string("Text", "Texto[1,4]","None")
		Text[1,5] = ini_read_string("Text", "Texto[1,5]","None")
		Text[1,6] = ini_read_string("Text", "Texto[1,6]","None")
		Text[1,7] = ini_read_string("Text", "Texto[1,7]","None")
		Text[1,8] = ini_read_string("Text", "Texto[1,8]","None")
	
		Text[2,0]  = ini_read_string("Text", "Texto[2,0]","None")
		Text[2,1]  = ini_read_string("Text", "Texto[2,1]","None")
		Text[2,2]  = ini_read_string("Text", "Texto[2,2]","None")
		Text[2,3]  = ini_read_string("Text", "Texto[2,3]","None")
		Text[2,4]  = ini_read_string("Text", "Texto[2,4]","None")
		Text[2,5]  = ini_read_string("Text", "Texto[2,5]","None")
		Text[2,6]  = ini_read_string("Text", "Texto[2,6]","None")
		Text[2,7]  = ini_read_string("Text", "Texto[2,7]","None")
		Text[2,8]  = ini_read_string("Text", "Texto[2,8]","None")
		Text[2,9]  = ini_read_string("Text", "Texto[2,9]","None")
		Text[2,10] = ini_read_string("Text", "Texto[2,10]","None")
		Text[2,11] = ini_read_string("Text", "Texto[2,11]","None")
		Text[2,12] = ini_read_string("Text", "Texto[2,12]","None")
	#endregion
	
	#region MenuText
		MenuText[0][0,0] = ini_read_string("Text", "MenuText[10,0]","None")
		MenuText[0][1,0] = ini_read_string("Text", "MenuText[11,0]","None")
	
		MenuText[0][2,0] = ini_read_string("Text", "MenuText[12,0]","None")
		MenuText[0][2,1] = ini_read_string("Text", "MenuText[12,1]","None")
	
		MenuText[0][3,0] = ini_read_string("Text", "MenuText[13,0]","None")
		MenuText[0][3,1] = ini_read_string("Text", "MenuText[13,1]","None")
		MenuText[0][3,2] = ini_read_string("Text", "MenuText[13,2]","None")
		MenuText[0][3,3] = ini_read_string("Text", "MenuText[13,3]","None")
		MenuText[0][3,4] = ini_read_string("Text", "MenuText[13,4]","None")
		MenuText[0][3,5] = ini_read_string("Text", "MenuText[13,5]","None")
		MenuText[0][3,6] = ini_read_string("Text", "MenuText[13,6]","None")
	
		MenuText[0][4,0] = ini_read_string("Text", "MenuText[14,0]","None")
		MenuText[0][4,1] = ini_read_string("Text", "MenuText[14,1]","None")
		MenuText[0][4,2] = ini_read_string("Text", "MenuText[14,2]","None")
		MenuText[0][4,3] = ini_read_string("Text", "MenuText[14,3]","None")
	
		MenuText[0][5,0] = ini_read_string("Text", "MenuText[15,0]","None")
		MenuText[0][5,1] = ini_read_string("Text", "MenuText[15,10]","None")
		MenuText[0][5,2] = ini_read_string("Text", "MenuText[15,11]","None")
		//-------------------------------------------------------------------
		
		MenuText[1][0,0] = ini_read_string("Text", "MenuText[20,0]","None")
		MenuText[1][0,1] = ini_read_string("Text", "MenuText[20,1]","None")
	
		MenuText[1][1,0] = ini_read_string("Text", "MenuText[21,0]","None")
		MenuText[1][1,1] = ini_read_string("Text", "MenuText[21,1]","None")
	
		MenuText[1][2,0] = ini_read_string("Text", "MenuText[22,0]","None")
		MenuText[1][2,1] = ini_read_string("Text", "MenuText[22,1]","None")
		MenuText[1][2,2] = ini_read_string("Text", "MenuText[22,2]","None")
		MenuText[1][2,3] = ini_read_string("Text", "MenuText[22,3]","None")
		MenuText[1][2,4] = ini_read_string("Text", "MenuText[22,4]","None")
		MenuText[1][2,5] = ini_read_string("Text", "MenuText[22,5]","None")
	
		MenuText[1][3,0] = ini_read_string("Text", "MenuText[23,0]","None")
		MenuText[1][3,1] = ini_read_string("Text", "MenuText[23,1]","None")
	
		MenuText[1][4,0] = ini_read_string("Text", "MenuText[24,0]","None")
		MenuText[1][4,1] = ini_read_string("Text", "MenuText[24,1]","None")
	
		MenuText[1][5,0] = ini_read_string("Text", "MenuText[25,0]","None")
		MenuText[1][5,1] = ini_read_string("Text", "MenuText[25,1]","None")
	
		MenuText[1][6,0] = ini_read_string("Text", "MenuText[26,0]","None")
		MenuText[1][6,1] = ini_read_string("Text", "MenuText[26,0]","None")
		
		MenuText[1][7,0] = ini_read_string("Text", "MenuText[27,0]","None")
		MenuText[1][7,1] = ini_read_string("Text", "MenuText[27,0]","None")
		
		MenuText[1][8,0] = ini_read_string("Text", "MenuText[28,0]","None")
		MenuText[1][8,1] = ini_read_string("Text", "MenuText[28,0]","None")
	
		MenuText[1][9,0] = ini_read_string("Text", "MenuText[29,0]","None")
		MenuText[1][9,1] = ini_read_string("Text", "MenuText[29,1]","None")

		MenuText[1][10,0] = ini_read_string("Text", "MenuText[210,0]","None")
		MenuText[1][10,1] = ini_read_string("Text", "MenuText[210,1]","None")
	
		MenuText[1][11,0] = ini_read_string("Text", "MenuText[211,0]","None")
		MenuText[1][11,1] = ini_read_string("Text", "MenuText[211,1]","None")
		
		MenuText[1][12,0] = ini_read_string("Text", "MenuText[212,0]","None")
		MenuText[1][12,1] = ini_read_string("Text", "MenuText[212,1]","None")
	#endregion
	
	#region Keys
		Keys[0] = ini_read_string("Text", "Keys[0,0]","None")
		Keys[1] = ini_read_string("Text", "Keys[0,1]","None")
		Keys[2] = ini_read_string("Text", "Keys[0,2]","None")
		Keys[3] = ini_read_string("Text", "Keys[0,3]","None")
		Keys[4] = ini_read_string("Text", "Keys[0,4]","None")
		Keys[5] = ini_read_string("Text", "Keys[0,5]","None")
		Keys[6] = ini_read_string("Text", "Keys[0,6]","None")
		Keys[7] = ini_read_string("Text", "Keys[0,7]","None")
		Keys[8] = ini_read_string("Text", "Keys[0,8]","None")
		Keys[9] = ini_read_string("Text", "Keys[0,9]","None")
	#endregion
	
	#region Descriptions
		Desc[0][0,0] = ini_read_string("Text", "Desc[0,0]","None")
		Desc[0][0,1] = ini_read_string("Text", "Desc[0,1]","None")
		Desc[0][0,2] = ini_read_string("Text", "Desc[0,2]","None")
		Desc[0][0,3] = ini_read_string("Text", "Desc[0,3]","None")
		Desc[0][0,4] = ini_read_string("Text", "Desc[0,4]","None")
		Desc[0][0,5] = ini_read_string("Text", "Desc[0,5]","None")
	
		Desc[0][1,0] = ini_read_string("Text", "Desc[1,0]","None")
		Desc[0][1,1] = ini_read_string("Text", "Desc[1,1]","None")
		Desc[0][1,2] = ini_read_string("Text", "Desc[1,2]","None")
		Desc[0][1,3] = ini_read_string("Text", "Desc[1,3]","None")
		Desc[0][1,4] = ini_read_string("Text", "Desc[1,4]","None")
		Desc[0][1,5] = ini_read_string("Text", "Desc[1,5]","None")
		Desc[0][1,6] = ini_read_string("Text", "Desc[1,6]","None")
		Desc[0][1,7] = ini_read_string("Text", "Desc[1,7]","None")
		Desc[0][1,8] = ini_read_string("Text", "Desc[1,8]","None")
	
		Desc[0][2,0]  = ini_read_string("Text", "Desc[2,0]","None")
		Desc[0][2,1]  = ini_read_string("Text", "Desc[2,1]","None")
		Desc[0][2,2]  = ini_read_string("Text", "Desc[2,2]","None")
		Desc[0][2,3]  = ini_read_string("Text", "Desc[2,3]","None")
		Desc[0][2,4]  = ini_read_string("Text", "Desc[2,4]","None")
		Desc[0][2,5]  = ini_read_string("Text", "Desc[2,5]","None")
		Desc[0][2,6]  = ini_read_string("Text", "Desc[2,6]","None")
		Desc[0][2,7]  = ini_read_string("Text", "Desc[2,7]","None")
		Desc[0][2,8]  = ini_read_string("Text", "Desc[2,8]","None")
		Desc[0][2,9]  = ini_read_string("Text", "Desc[2,9]","None")
		Desc[0][2,10] = ini_read_string("Text", "Desc[2,10]","None")
		Desc[0][2,11] = ini_read_string("Text", "Desc[2,11]","None")
		Desc[0][2,12] = ini_read_string("Text", "Desc[2,12]","None")
	
		Desc[0][3,0] = ini_read_string("Text", "Desc[3,0]","None")
		Desc[0][3,1] = ini_read_string("Text", "Desc[3,1]","None")
		Desc[0][3,3] = ini_read_string("Text", "Desc[3,3]","None")
		Desc[0][3,4] = ini_read_string("Text", "Desc[3,4]","None")
		Desc[0][3,5] = ini_read_string("Text", "Desc[3,5]","None")
		Desc[0][3,6] = ini_read_string("Text", "Desc[3,6]","None")
	
		Desc[0][3,2] = ini_read_string("Text", "Desc[3,20]","None")
		Desc[1][3,2] = ini_read_string("Text", "Desc[3,21]","None")
		Desc[2][3,2] = ini_read_string("Text", "Desc[3,22]","None")
		Desc[3][3,2] = ini_read_string("Text", "Desc[3,23]","None")
		Desc[4][3,2] = ini_read_string("Text", "Desc[3,24]","None")
		Desc[5][3,2] = ini_read_string("Text", "Desc[3,25]","None")
		Desc[6][3,2] = ini_read_string("Text", "Desc[3,26]","None")
	#endregion
	
	ini_close()
}
	
function JsonDataSave(){
	
	var _ScoreData  = DataEncoder(Scores)
	var _OptCntData = DataEncoder(Options) + 2 * DataEncoder(CurrentButtons) + 3 * DataEncoder(CurJPadButtons)
	
	var _ScoreHash  = sha1_string_utf8(string(_ScoreData))
	var _OptCntHash = sha1_string_utf8(string(_OptCntData))
	
	var _Data = {
		Ver : GM_version,
		
		Opt  : Options,
		Cbt  : CurrentButtons,
		Cgp  : CurJPadButtons,
		Scr  : Scores,
		SKey : _ScoreHash,
		OKey : _OptCntHash,
	};
	
	var _jsonString = json_stringify(_Data)
	SaveString(_jsonString, "SaveData.sav")
};

function JsonDataLoad(){
	
	var _jsonString  = LoadString("SaveData.sav")
	var _comp = false
	
	if(_jsonString == "") _jsonString = -1
	
	if(_jsonString != -1)
	{
		var _Data	= json_parse(_jsonString)
		var _ver;
		
		if(variable_struct_exists(_Data, "Ver")) _ver = _Data.Ver
		else									 _ver = -1
		
		if(_ver != -1)
		{
			var _strsize = string_length(_ver)
			var _tempver;
			
			if(_strsize > 5) _tempver = string_copy(_ver, 1, _strsize - 2)
			else			 _tempver = _ver
			
			ErrorType = 3
			
			var i;
			for(i = 0; i < 20; i++)
			{
				if(string(_tempver) == Compatible[i])
				{
					ErrorType = -1
					_comp = true
					break;
				}
			}
		}
		else ErrorType = 2
	}
	else ErrorType = 1

	if(!_comp)
	{
		LoadError = true
		exit
	}
	
	if(variable_struct_exists(_Data, "Opt")) Options		= _Data.Opt
	else ErrorType = 4
	if(variable_struct_exists(_Data, "Cbt")) CurrentButtons	= _Data.Cbt
	else ErrorType = 4
	if(variable_struct_exists(_Data, "Cgp")) CurJPadButtons	= _Data.Cgp
	else ErrorType = 4
	if(variable_struct_exists(_Data, "Scr")) Scores			= _Data.Scr
	else ErrorType = 4
	
	var _ScoreCheck = ""
	var _OptCheck   = ""
	
	if(variable_struct_exists(_Data, "SKey")) _ScoreCheck	= _Data.SKey
	if(variable_struct_exists(_Data, "OKey")) _OptCheck		= _Data.OKey
	
	var _ScoreData  = DataEncoder(Scores)
	var _OptCntData = DataEncoder(Options) + 2 * DataEncoder(CurrentButtons) + 3 * DataEncoder(CurJPadButtons)
	
	var _ScoreHash  = sha1_string_utf8(string(_ScoreData))
	var _OptCntHash = sha1_string_utf8(string(_OptCntData))
	
	if(_OptCheck   != _OptCntHash) ErrorType = 6
	if(_ScoreCheck != _ScoreHash)  ErrorType = 5
	
	switch(Options[2])
	{
		case 0: LanFile = "ENG_Text.ini"; break;
		case 1:	LanFile = "ESP_Text.ini"; break;
		case 2: LanFile = "VIE_Text.ini"; break;
						
		default:
			LanFile = "ENG_Text.ini"
			break;
	}
	
	if(ErrorType > 0) LoadError = true
	
	audio_master_gain(Options[8]/100)
};

function SaveString(str, _file){
	var _buffer = buffer_create(string_byte_length(str) + 1, buffer_fixed, 1)
	buffer_write(_buffer,buffer_string,str)
	buffer_save(_buffer, _file)
	buffer_delete(_buffer)
}

function LoadString(_file){
	var _buffer = buffer_load(_file)
	var _buffsz = buffer_get_size(_buffer)
	var _str    = ""
	
	if(_buffer != -1 and _buffsz > 0)
	{
		_str	= buffer_read(_buffer, buffer_string)
	
		buffer_delete(_buffer)
	}
	return _str
}
	
function DataEncoder(_Array){
	
	var i, _size = array_length(_Array);
	var _S = 0;
	var _temp = 0
	var _Primes = [2,3,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71,73,79,83,89,97,
          101,103,107,109,113,127,131,137,139,149,151,157,163,167,173,179,181,191,
          193,197,199,211,223,227,229,233,239,241,251,257,263,269,271,277,281,283,
          293,307,311,313,317,331,337,347,349,353,359,367,373,379,383,389,397,401,
          409,419,421,431,433,439,443,457,461,463,467,479,487,491,499,503,509,521,
          523,541,547,557,563,569,571,577,587,593,599,601,607,613,617,619,631,641,
          643,647,653,659,661,673,677,683,691,701,709,719,727,733,739,773,751,757]
	
	for(i = 0; i < _size; i++)
	{
		if(!is_string(_Array[i])) _S += _Array[i] * _Primes[i];
		else
		{
			if(_Array[i] != "")
			{
				_temp = string_digits(_Array[i])
				_S   += real(_temp) * _Primes[i]
			}
			else _S += (i + 1) * _Primes[i]
		}
	}
	
	return _S
}