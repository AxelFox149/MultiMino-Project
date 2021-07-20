Date  = string(current_day) + "-" + string (current_month) + "-" + string(current_year) + " "
Date  = Date + string(current_hour) + " " + string(current_minute) + " " + string(current_second)

//screen_save(working_directory + "\screenshots\" + Date + ".png")

screen_save_part(working_directory + "\\screenshots\\" + Date + ".png",0,0,window_get_width(),window_get_height());

flag = true
alarm[0] = 10

