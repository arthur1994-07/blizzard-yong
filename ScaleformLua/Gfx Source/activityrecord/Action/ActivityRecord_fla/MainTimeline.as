package ActivityRecord_fla
{
    import flash.display.*;
    import flash.events.*;
    import flash.external.*;
    import flash.text.*;
    import ran.ui.utils.*;
    import scaleform.clik.controls.*;
    import scaleform.clik.events.*;

    dynamic public class MainTimeline extends MovieClip
    {
        public var tfDisableTraining:TextField;
        public var GrowGuidePage:MovieClip;
        public var ProfilePage:MovieClip;
        public var TodayPage:MovieClip;
        public var TrainingPage:MovieClip;
        public var RankingPage:MovieClip;
        public var ActivityPage:MovieClip;
        public var AttendancePage:MovieClip;
        public var GrowGuidTab:Button;
        public var ProfileTab:Button;
        public var TodayMissionTab:Button;
        public var TrainingTab:Button;
        public var RankingTab:Button;
        public var ActivityTab:Button;
        public var AttendanceTab:Button;
        public var imgTrainingComplete:MovieClip;
        public var enableTraining:Boolean;

        public function MainTimeline()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_GrowGuidTab_Scene1_tab_0();
            this.__setProp_ProfileTab_Scene1_tab_0();
            this.__setProp_TodayMissionTab_Scene1_tab_0();
            this.__setProp_TrainingTab_Scene1_tab_0();
            this.__setProp_RankingTab_Scene1_tab_0();
            this.__setProp_ActivityTab_Scene1_tab_0();
            this.__setProp_AttendanceTab_Scene1_tab_0();
            return;
        }// end function

        public function onEnter(event:Event) : void
        {
            removeEventListener(Event.ENTER_FRAME, this.onEnter);
            this.GrowGuidTab.addEventListener(ButtonEvent.CLICK, this.onGrowGuideClick, false, 0, true);
            this.ProfileTab.addEventListener(ButtonEvent.CLICK, this.onProfileClick, false, 0, true);
            this.TodayMissionTab.addEventListener(ButtonEvent.CLICK, this.onTodayMissionClick, false, 0, true);
            this.TrainingTab.addEventListener(ButtonEvent.CLICK, this.onTraningClick, false, 0, true);
            this.RankingTab.addEventListener(ButtonEvent.CLICK, this.onRankingClick, false, 0, true);
            this.ActivityTab.addEventListener(ButtonEvent.CLICK, this.onActivityClick, false, 0, true);
            this.AttendanceTab.addEventListener(ButtonEvent.CLICK, this.onAttendanceClick, false, 0, true);
            this.onGrowGuideClick(null);
            return;
        }// end function

        public function onGrowGuideClick(event:ButtonEvent) : void
        {
            this.GrowGuidePage.visible = true;
            this.ProfilePage.visible = false;
            this.TodayPage.visible = false;
            this.TrainingPage.visible = false;
            this.RankingPage.visible = false;
            this.ActivityPage.visible = false;
            this.AttendancePage.visible = false;
            this.GrowGuidTab.selected = true;
            this.ProfileTab.selected = false;
            this.TodayMissionTab.selected = false;
            this.TrainingTab.selected = false;
            this.RankingTab.selected = false;
            this.ActivityTab.selected = false;
            this.AttendanceTab.selected = false;
            this.tfDisableTraining.visible = false;
            this.NotifyTabChange(0);
            return;
        }// end function

        public function onProfileClick(event:ButtonEvent) : void
        {
            this.GrowGuidePage.visible = false;
            this.ProfilePage.visible = true;
            this.TodayPage.visible = false;
            this.TrainingPage.visible = false;
            this.RankingPage.visible = false;
            this.ActivityPage.visible = false;
            this.AttendancePage.visible = false;
            this.GrowGuidTab.selected = false;
            this.ProfileTab.selected = true;
            this.TodayMissionTab.selected = false;
            this.TrainingTab.selected = false;
            this.RankingTab.selected = false;
            this.ActivityTab.selected = false;
            this.AttendanceTab.selected = false;
            this.tfDisableTraining.visible = false;
            this.NotifyTabChange(1);
            return;
        }// end function

        public function onTodayMissionClick(event:ButtonEvent) : void
        {
            this.GrowGuidePage.visible = false;
            this.ProfilePage.visible = false;
            this.TodayPage.visible = true;
            this.TrainingPage.visible = false;
            this.RankingPage.visible = false;
            this.ActivityPage.visible = false;
            this.AttendancePage.visible = false;
            this.GrowGuidTab.selected = false;
            this.ProfileTab.selected = false;
            this.TodayMissionTab.selected = true;
            this.TrainingTab.selected = false;
            this.RankingTab.selected = false;
            this.ActivityTab.selected = false;
            this.AttendanceTab.selected = false;
            this.tfDisableTraining.visible = false;
            this.NotifyTabChange(2);
            return;
        }// end function

        public function onTraningClick(event:ButtonEvent) : void
        {
            this.GrowGuidePage.visible = false;
            this.ProfilePage.visible = false;
            this.TodayPage.visible = false;
            this.RankingPage.visible = false;
            this.ActivityPage.visible = false;
            this.AttendancePage.visible = false;
            if (this.enableTraining == true)
            {
                this.TrainingPage.visible = true;
                this.tfDisableTraining.visible = false;
            }
            else
            {
                this.TrainingPage.visible = false;
                this.tfDisableTraining.visible = true;
            }
            this.GrowGuidTab.selected = false;
            this.ProfileTab.selected = false;
            this.TodayMissionTab.selected = false;
            this.TrainingTab.selected = true;
            this.RankingTab.selected = false;
            this.ActivityTab.selected = false;
            this.AttendanceTab.selected = false;
            this.NotifyTabChange(3);
            return;
        }// end function

        public function onRankingClick(event:ButtonEvent) : void
        {
            this.GrowGuidePage.visible = false;
            this.ProfilePage.visible = false;
            this.TodayPage.visible = false;
            this.TrainingPage.visible = false;
            this.RankingPage.visible = true;
            this.ActivityPage.visible = false;
            this.AttendancePage.visible = false;
            this.GrowGuidTab.selected = false;
            this.ProfileTab.selected = false;
            this.TodayMissionTab.selected = false;
            this.TrainingTab.selected = false;
            this.RankingTab.selected = true;
            this.ActivityTab.selected = false;
            this.AttendanceTab.selected = false;
            this.tfDisableTraining.visible = false;
            this.NotifyTabChange(4);
            return;
        }// end function

        public function onActivityClick(event:ButtonEvent) : void
        {
            this.GrowGuidePage.visible = false;
            this.ProfilePage.visible = false;
            this.TodayPage.visible = false;
            this.TrainingPage.visible = false;
            this.RankingPage.visible = false;
            this.ActivityPage.visible = true;
            this.AttendancePage.visible = false;
            this.GrowGuidTab.selected = false;
            this.ProfileTab.selected = false;
            this.TodayMissionTab.selected = false;
            this.TrainingTab.selected = false;
            this.RankingTab.selected = false;
            this.ActivityTab.selected = true;
            this.AttendanceTab.selected = false;
            this.tfDisableTraining.visible = false;
            this.NotifyTabChange(5);
            return;
        }// end function

        public function onAttendanceClick(event:ButtonEvent) : void
        {
            this.GrowGuidePage.visible = false;
            this.ProfilePage.visible = false;
            this.TodayPage.visible = false;
            this.TrainingPage.visible = false;
            this.RankingPage.visible = false;
            this.ActivityPage.visible = false;
            this.AttendancePage.visible = true;
            this.GrowGuidTab.selected = false;
            this.ProfileTab.selected = false;
            this.TodayMissionTab.selected = false;
            this.TrainingTab.selected = false;
            this.RankingTab.selected = false;
            this.ActivityTab.selected = false;
            this.AttendanceTab.selected = true;
            this.tfDisableTraining.visible = false;
            this.NotifyTabChange(6);
            return;
        }// end function

        public function SetTabText(param1:String, param2:String, param3:String, param4:String, param5:String, param6:String, param7:String) : void
        {
            this.GrowGuidTab.label = param1;
            this.ProfileTab.label = param2;
            this.TodayMissionTab.label = param3;
            this.TrainingTab.label = param4;
            this.RankingTab.label = param5;
            this.ActivityTab.label = param6;
            this.AttendanceTab.label = param7;
            return;
        }// end function

        public function SetEnableTraining(param1:Object) : void
        {
            this.tfDisableTraining.text = param1.text;
            this.enableTraining = int(param1.enable) == 1;
            if (this.TrainingTab.selected == true)
            {
                this.onTraningClick(null);
            }
            return;
        }// end function

        public function SetTrainingComplete(param1:String) : void
        {
            this.imgTrainingComplete.visible = param1 == "0" ? (false) : (true);
            return;
        }// end function

        public function NotifyTabChange(param1:int) : void
        {
            var _loc_2:* = [Util.OBJ_TYPE_INT];
            var _loc_3:* = [param1];
            ExternalInterface.call("OnCustomEvent", "ActivityRecord_TabChange", _loc_2, _loc_3);
            return;
        }// end function

        function __setProp_GrowGuidTab_Scene1_tab_0()
        {
            try
            {
                this.GrowGuidTab["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.GrowGuidTab.autoRepeat = false;
            this.GrowGuidTab.autoSize = "none";
            this.GrowGuidTab.enabled = true;
            this.GrowGuidTab.focusable = false;
            this.GrowGuidTab.groupName = "";
            this.GrowGuidTab.label = "";
            this.GrowGuidTab.overlayAlign = "none";
            this.GrowGuidTab.overlayImg = "";
            this.GrowGuidTab.overlayPadding = {x:0, y:0};
            this.GrowGuidTab.selected = false;
            this.GrowGuidTab.toggle = true;
            this.GrowGuidTab.visible = true;
            try
            {
                this.GrowGuidTab["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_ProfileTab_Scene1_tab_0()
        {
            try
            {
                this.ProfileTab["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.ProfileTab.autoRepeat = false;
            this.ProfileTab.autoSize = "none";
            this.ProfileTab.enabled = true;
            this.ProfileTab.focusable = false;
            this.ProfileTab.groupName = "";
            this.ProfileTab.label = "";
            this.ProfileTab.overlayAlign = "none";
            this.ProfileTab.overlayImg = "";
            this.ProfileTab.overlayPadding = {x:0, y:0};
            this.ProfileTab.selected = false;
            this.ProfileTab.toggle = true;
            this.ProfileTab.visible = true;
            try
            {
                this.ProfileTab["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_TodayMissionTab_Scene1_tab_0()
        {
            try
            {
                this.TodayMissionTab["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.TodayMissionTab.autoRepeat = false;
            this.TodayMissionTab.autoSize = "none";
            this.TodayMissionTab.enabled = true;
            this.TodayMissionTab.focusable = false;
            this.TodayMissionTab.groupName = "";
            this.TodayMissionTab.label = "";
            this.TodayMissionTab.overlayAlign = "none";
            this.TodayMissionTab.overlayImg = "";
            this.TodayMissionTab.overlayPadding = {x:0, y:0};
            this.TodayMissionTab.selected = false;
            this.TodayMissionTab.toggle = true;
            this.TodayMissionTab.visible = true;
            try
            {
                this.TodayMissionTab["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_TrainingTab_Scene1_tab_0()
        {
            try
            {
                this.TrainingTab["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.TrainingTab.autoRepeat = false;
            this.TrainingTab.autoSize = "none";
            this.TrainingTab.enabled = true;
            this.TrainingTab.focusable = false;
            this.TrainingTab.groupName = "";
            this.TrainingTab.label = "";
            this.TrainingTab.overlayAlign = "none";
            this.TrainingTab.overlayImg = "";
            this.TrainingTab.overlayPadding = {x:0, y:0};
            this.TrainingTab.selected = false;
            this.TrainingTab.toggle = true;
            this.TrainingTab.visible = true;
            try
            {
                this.TrainingTab["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_RankingTab_Scene1_tab_0()
        {
            try
            {
                this.RankingTab["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.RankingTab.autoRepeat = false;
            this.RankingTab.autoSize = "none";
            this.RankingTab.enabled = true;
            this.RankingTab.focusable = false;
            this.RankingTab.groupName = "";
            this.RankingTab.label = "";
            this.RankingTab.overlayAlign = "none";
            this.RankingTab.overlayImg = "";
            this.RankingTab.overlayPadding = {x:0, y:0};
            this.RankingTab.selected = false;
            this.RankingTab.toggle = true;
            this.RankingTab.visible = true;
            try
            {
                this.RankingTab["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_ActivityTab_Scene1_tab_0()
        {
            try
            {
                this.ActivityTab["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.ActivityTab.autoRepeat = false;
            this.ActivityTab.autoSize = "none";
            this.ActivityTab.enabled = true;
            this.ActivityTab.focusable = false;
            this.ActivityTab.groupName = "";
            this.ActivityTab.label = "";
            this.ActivityTab.overlayAlign = "none";
            this.ActivityTab.overlayImg = "";
            this.ActivityTab.overlayPadding = {x:0, y:0};
            this.ActivityTab.selected = false;
            this.ActivityTab.toggle = true;
            this.ActivityTab.visible = true;
            try
            {
                this.ActivityTab["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_AttendanceTab_Scene1_tab_0()
        {
            try
            {
                this.AttendanceTab["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.AttendanceTab.autoRepeat = false;
            this.AttendanceTab.autoSize = "none";
            this.AttendanceTab.enabled = true;
            this.AttendanceTab.focusable = true;
            this.AttendanceTab.groupName = "";
            this.AttendanceTab.label = "";
            this.AttendanceTab.overlayAlign = "none";
            this.AttendanceTab.overlayImg = "";
            this.AttendanceTab.overlayPadding = {x:0, y:0};
            this.AttendanceTab.selected = false;
            this.AttendanceTab.toggle = true;
            this.AttendanceTab.visible = false;
            try
            {
                this.AttendanceTab["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function frame1()
        {
            this.imgTrainingComplete.visible = false;
            this.enableTraining = true;
            addEventListener(Event.ENTER_FRAME, this.onEnter, false, 0, true);
            return;
        }// end function

    }
}
