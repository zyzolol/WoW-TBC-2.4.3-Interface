﻿-- 우리말 작업 by damjau

local L = LibStub("AceLocale-3.0"):NewLocale("BugSack", "koKR")
if not L then return end

-- Command descriptions
L["Show sack"] = "자루 표시"
L["Show errors in the sack."] = "자루 안에 오류 메세지를 표시합니다"
L["Current error"] = "현재 오류"
L["Show the current error."] = "현재 발생한 오류 메세지를 표시합니다"
L["Current session"] = "현 접속"
L["Show errors from the current session."] = "현 접속중에 발생한 오류 메세지를 표시합니다"
L["Previous session"] = "이전 접속"
L["Show errors from the previous session."] = "이전 접속 중에 발생한 오류 메세지를 표시합니다"
L["By session number"] = "접속 횟수에 따라서"
L["Show errors by session number."] = "지정된 횟수의 접속 중에 발생한 오류 메세지를 표시합니다"
L["All errors"] = "모든 오류"
L["Show all errors."] = "모든 오류 메세지를 표시합니다"
L["Received errors"] = "받은 오류"
L["Show errors received from another player."] = "다른 플레이어에게서 받은 오류를 표시합니다."
L["Send bugs"] = "버그 보내기"
L["Sends your current session bugs to another BugSack user."] = "다른 사용자에게 현재 접속중 오류를 보냅니다. 단, AceComm-2.0와 BugSack이 설치되어 있어야합니다."
L["<player name>"] = "<플레이어명>"
L["Menu"] = "메뉴"
L["Menu options."] = "메뉴 설정입니다."

L["List errors"] = "오류 목록"
L["List errors to the chat frame."] = "대화창에 오류 목록을 표시합니다"
L["List the current error."] = "현재발생한 오류 목록을 표시합니다"
L["List errors from the current session."] = "현재 접속중에 발생한 오류 목록을 표시합니다"
L["List errors from the previous session."] = "이전 접속중에 발생한 오류 목록을 표시합니다"
L["List errors by session number."] = "지정된 횟수의 접속중에 발생한 오류 목록을 표시합니다"
L["List all errors."] = "모든 오류 목록을 표시합니다"
L["List errors received from another player."] = "다른 플레이어에게서 받은 오류 목록을 표시합니다."

L["Auto popup"] = "자동 표시"
L["Toggle auto BugSack frame popup."] = "벌레 자루 팝업창 자동 표시 기능을 토글합니다"
L["Chatframe output"] = "대화창 출력"
L["Print a warning to the chat frame when an error occurs."] = "오류 발생시에 대화창에 경고를 출력합니다"
L["Errors to chatframe"] = "대화창 오류 출력"
L["Print the full error message to the chat frame instead of just a warning."] = "오류 발생시에 대화창에 경고 대신에 오류 메세지 전체를 출력합니다"
L["Sound"] = "효과음"
L["What sound to play when an error occurs (Ctrl-Click to preview.)"] = "오류 발생 시 재생할 효과음을 선택합니다 (미리 듣기는 CTRL-클릭하세요)."
L["Mute"] = "무음"
L["Toggle an audible warning everytime an error occurs."] = "오류가 발생할 시에 경고음 사용기능을 토글합니다"
L["Save errors"] = "오류 저장"
L["Toggle whether to save errors to your SavedVariables\\!BugGrabber.lua file."] = "SaveVariables\\!BugGrabber.lua 파일에 모든 오류를 저장할지 아닐지 토글합니다"
L["Limit"] = "제한"
L["Set the limit on the nr of errors saved."] = "저장된 오류의 갯수를 제한합니다"
L["Filter addon mistakes"] = "잘못된 애드온 필터"
L["Filters common mistakes that trigger the blocked/forbidden event."] = "막히고 금지된 이벤트를 일으키는 공통의 실수를 필터합니다"
L["Throttle at excessive amount"] = "과도한 오류 제한"
L["Whether to throttle for a default of 60 seconds when BugGrabber catches more than 20 errors per second."] = "BugGrabber가 초당 20개 이상의 오류를 검출했을 때 60초 동안 조절합니다."

L["Generate bug"] = "오류 생성"
L["Generate a fake bug for testing."] = "시험용으로 거짓 오류를 생성합니다"
L["Script bug"] = "스크립트 오류"
L["Generate a script bug."] = "스크립트 오류를 생성합니다"
L["Addon bug"] = "애드온 오류"
L["Generate an addon bug."] = "애드온 오류를 생성합니다"

L["Clear errors"] = "오류 삭제"
L["Clear out the errors database."] = "데이터베이스에 저장된 오류를 초기화합니다"

L["%d sec."] = "%d 초."
L["|cffeda55fBugGrabber|r is paused due to an excessive amount of errors being generated. It will resume normal operations in |cffff0000%d|r seconds. |cffeda55fDouble-Click|r to resume now."] = "|cffeda55fBugGrabber|r가 과도한 량의 오류를 처리하는 동안 일시 중지되었습니다. |cffff0000%d|r 초 내에 정상 기능을 수행할 것입니다. 지금 재시작 하려면 |cffeda55f더블-클릭|r 하세요."

-- Chat messages
L["You have no errors, yay!"] = "오류가 발생하지 않았습니다, 유훗~!"
L["List of errors:"] = "오류 목록:"
L["An error has been generated."] = "1개의 오류가 발생했습니다"
L["BugSack generated this fake error."] = "벌레자루가 이 거짓 오류를 생성해냈습니다"
L["All errors were wiped."] = "모든 오류가 삭제되었습니다"
L["An error has been recorded."] = "1개의 오류가 기록되었습니다"
L["%d errors have been recorded."] = "%d개의 오류가 기록되었습니다."
L["You've received %d errors from %s, you can show them with /bugsack show received."] = "%d개의 오류를 %s에게서 받았습니다, /bugsack show received 를 이용해 볼 수 있습니다."
L["%d errors has been sent to %s. He must have BugSack to be able to read them."] = "%s에게 %d개의 오류를 보냈습니다. 만일 그가 BugSack 과 AceComm-2.0을 사용하지 않는다면, 그는 오류를 확인 할 수 없습니다."

-- Frame messages,
L[" (... more ...)"] = " (... 이상 ...)"
L["No errors found"] = "발견된 오류가 없습니다."
L["Error %d of %d"] = "%2$d개의 오류 중 %1$d번째 오류"
L[" (viewing last error)"] = " (마지막 오류 보기)"
L[" (viewing session errors)"] = " (현 접속중 발생한 오류 보기)"
L[" (viewing previous session errors)"] = " (이전 접속중 발생한 오류 보기)"
L[" (viewing all errors)"] = " (모든 오류 보기)"
L[" (viewing errors for session %d)"] = " (%d번째 접속중 발생한 오류 보기)"
L[" (viewing errors from %s)"] = " (%s의 오류 보기)"

-- FuBar plugin
L["|cffeda55fClick|r to open BugSack with the last error. |cffeda55fShift-Click|r to reload the user interface. |cffeda55fAlt-Click|r to clear the sack."] = "마지막 오류를 표시 하려면 |cffeda55f클릭|r하세요. 사용자 인터페이스를 재실행 하려면 |cffeda55fSHIFT-클릭|r하세요. 초기화 하려면 |cffeda55fALT-클릭|r하세요."


if GetLocale() == "koKR" then
	BugSackNextButton:SetText("다음")
	BugSackLastButton:SetText("마지막")
	BugSackPrevButton:SetText("이전")
	BugSackFirstButton:SetText("처음")
end
