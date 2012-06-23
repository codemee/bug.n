/**
 *	bug.n - tiling window management
 *	Copyright (c) 2010-2012 joten
 *
 *	This program is free software: you can redistribute it and/or modify
 *	it under the terms of the GNU General Public License as published by
 *	the Free Software Foundation, either version 3 of the License, or
 *	(at your option) any later version.
 *
 *	This program is distributed in the hope that it will be useful,
 *	but WITHOUT ANY WARRANTY; without even the implied warranty of
 *	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *	GNU General Public License for more details.
 *
 *	You should have received a copy of the GNU General Public License
 *	along with this program. If not, see <http://www.gnu.org/licenses/>.
 *
 *	@version 8.3.0
 */



Log_msg( message ) {
	FormatTime, CurrentTime, , yyyyMMddHHmmss
	FileAppend, %CurrentTime%  %message%`r`n, bugn_log.txt
}

Log_bare( message ) {
	Local padded_message
	padded_message := "    " . message . "`r`n"
	FileAppend, %padded_message% , bugn_log.txt
}

Log_debug_enabled := 0

Log_toggleDebugEnabled() {
	Global
	If (Log_debug_enabled = 1)
		Log_debug_enabled := 0
	Else
		Log_debug_enabled := 1
	If (Log_debug_enabled = 1)
		Log_msg("Debug log enabled (" . Log_debug_enabled . ")")
	Else
		Log_msg("Debug log disabled (" . Log_debug_enabled . ")")
}

Log_dbg_msg( message ) {
	Global
	If (Log_debug_enabled = 1)
		Log_msg( "DEBUG:  " . message )
}

Log_dbg_bare( message ) {
	Global
	If (Log_debug_enabled = 1)
		Log_bare( "DEBUG:  " . message )
}