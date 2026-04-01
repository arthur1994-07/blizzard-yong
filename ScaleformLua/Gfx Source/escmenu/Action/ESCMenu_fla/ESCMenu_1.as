package ESCMenu_fla
{
    import flash.display.*;
    import flash.events.*;
    import flash.utils.*;
    import scaleform.clik.controls.*;

    dynamic public class ESCMenu_1 extends MovieClip
    {
        public var __setPropDict:Dictionary;
        public var __lastFrameProp:int = -1;
        public var btnServerSelect:Button;
        public var btnOption:Button;
        public var btnKeyboardShortcut:Button;
        public var btnHelp:Button;
        public var btnMarkOfRank:Button;
        public var btnCustomerService:Button;
        public var btnForum:Button;
        public var btnGameClose:Button;

        public function ESCMenu_1()
        {
            this.__setPropDict = new Dictionary(true);
            addFrameScript(0, this.frame1, 9, this.frame10, 19, this.frame20, 29, this.frame30);
            this.__setProp_btnServerSelect_ESCMenu_asset_0();
            this.__setProp_btnOption_ESCMenu_asset_0();
            this.__setProp_btnKeyboardShortcut_ESCMenu_asset_0();
            this.__setProp_btnHelp_ESCMenu_asset_0();
            this.__setProp_btnGameClose_ESCMenu_asset_0();
            addEventListener(Event.FRAME_CONSTRUCTED, this.__setProp_handler, false, 0, true);
            return;
        }// end function

        function __setProp_btnServerSelect_ESCMenu_asset_0()
        {
            try
            {
                this.btnServerSelect["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnServerSelect.autoRepeat = false;
            this.btnServerSelect.autoSize = "none";
            this.btnServerSelect.enabled = true;
            this.btnServerSelect.focusable = false;
            this.btnServerSelect.groupName = "";
            this.btnServerSelect.label = "";
            this.btnServerSelect.overlayAlign = "none";
            this.btnServerSelect.overlayImg = "";
            this.btnServerSelect.overlayPadding = {x:0, y:0};
            this.btnServerSelect.selected = false;
            this.btnServerSelect.toggle = false;
            this.btnServerSelect.visible = true;
            try
            {
                this.btnServerSelect["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnOption_ESCMenu_asset_0()
        {
            try
            {
                this.btnOption["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnOption.autoRepeat = false;
            this.btnOption.autoSize = "none";
            this.btnOption.enabled = true;
            this.btnOption.focusable = false;
            this.btnOption.groupName = "";
            this.btnOption.label = "";
            this.btnOption.overlayAlign = "none";
            this.btnOption.overlayImg = "";
            this.btnOption.overlayPadding = {x:0, y:0};
            this.btnOption.selected = false;
            this.btnOption.toggle = false;
            this.btnOption.visible = true;
            try
            {
                this.btnOption["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnKeyboardShortcut_ESCMenu_asset_0()
        {
            try
            {
                this.btnKeyboardShortcut["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnKeyboardShortcut.autoRepeat = false;
            this.btnKeyboardShortcut.autoSize = "none";
            this.btnKeyboardShortcut.enabled = true;
            this.btnKeyboardShortcut.focusable = false;
            this.btnKeyboardShortcut.groupName = "";
            this.btnKeyboardShortcut.label = "";
            this.btnKeyboardShortcut.overlayAlign = "none";
            this.btnKeyboardShortcut.overlayImg = "";
            this.btnKeyboardShortcut.overlayPadding = {x:0, y:0};
            this.btnKeyboardShortcut.selected = false;
            this.btnKeyboardShortcut.toggle = false;
            this.btnKeyboardShortcut.visible = true;
            try
            {
                this.btnKeyboardShortcut["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnHelp_ESCMenu_asset_0()
        {
            try
            {
                this.btnHelp["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnHelp.autoRepeat = false;
            this.btnHelp.autoSize = "none";
            this.btnHelp.enabled = true;
            this.btnHelp.focusable = false;
            this.btnHelp.groupName = "";
            this.btnHelp.label = "";
            this.btnHelp.overlayAlign = "none";
            this.btnHelp.overlayImg = "";
            this.btnHelp.overlayPadding = {x:0, y:0};
            this.btnHelp.selected = false;
            this.btnHelp.toggle = false;
            this.btnHelp.visible = true;
            try
            {
                this.btnHelp["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnMarkOfRank_ESCMenu_asset_0(param1:int)
        {
            var curFrame:* = param1;
            if (this.btnMarkOfRank != null && curFrame >= 1 && curFrame <= 10 && (this.__setPropDict[this.btnMarkOfRank] == undefined || !(int(this.__setPropDict[this.btnMarkOfRank]) >= 1 && int(this.__setPropDict[this.btnMarkOfRank]) <= 10)))
            {
                this.__setPropDict[this.btnMarkOfRank] = curFrame;
                try
                {
                    this.btnMarkOfRank["componentInspectorSetting"] = true;
                }
                catch (e:Error)
                {
                }
                this.btnMarkOfRank.autoRepeat = false;
                this.btnMarkOfRank.autoSize = "none";
                this.btnMarkOfRank.enabled = true;
                this.btnMarkOfRank.focusable = false;
                this.btnMarkOfRank.groupName = "";
                this.btnMarkOfRank.label = "";
                this.btnMarkOfRank.overlayAlign = "none";
                this.btnMarkOfRank.overlayImg = "";
                this.btnMarkOfRank.overlayPadding = {x:0, y:0};
                this.btnMarkOfRank.selected = false;
                this.btnMarkOfRank.toggle = false;
                this.btnMarkOfRank.visible = true;
                try
                {
                    this.btnMarkOfRank["componentInspectorSetting"] = false;
                }
                catch (e:Error)
                {
                }
            }
            return;
        }// end function

        function __setProp_btnCustomerService_ESCMenu_asset_0(param1:int)
        {
            var curFrame:* = param1;
            if (this.btnCustomerService != null && curFrame >= 1 && curFrame <= 10 && (this.__setPropDict[this.btnCustomerService] == undefined || !(int(this.__setPropDict[this.btnCustomerService]) >= 1 && int(this.__setPropDict[this.btnCustomerService]) <= 10)))
            {
                this.__setPropDict[this.btnCustomerService] = curFrame;
                try
                {
                    this.btnCustomerService["componentInspectorSetting"] = true;
                }
                catch (e:Error)
                {
                }
                this.btnCustomerService.autoRepeat = false;
                this.btnCustomerService.autoSize = "none";
                this.btnCustomerService.enabled = true;
                this.btnCustomerService.focusable = false;
                this.btnCustomerService.groupName = "";
                this.btnCustomerService.label = "";
                this.btnCustomerService.overlayAlign = "none";
                this.btnCustomerService.overlayImg = "";
                this.btnCustomerService.overlayPadding = {x:0, y:0};
                this.btnCustomerService.selected = false;
                this.btnCustomerService.toggle = false;
                this.btnCustomerService.visible = true;
                try
                {
                    this.btnCustomerService["componentInspectorSetting"] = false;
                }
                catch (e:Error)
                {
                }
            }
            return;
        }// end function

        function __setProp_btnGameClose_ESCMenu_asset_0()
        {
            try
            {
                this.btnGameClose["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnGameClose.autoRepeat = false;
            this.btnGameClose.autoSize = "none";
            this.btnGameClose.enabled = true;
            this.btnGameClose.focusable = false;
            this.btnGameClose.groupName = "";
            this.btnGameClose.label = "";
            this.btnGameClose.overlayAlign = "none";
            this.btnGameClose.overlayImg = "";
            this.btnGameClose.overlayPadding = {x:0, y:0};
            this.btnGameClose.selected = false;
            this.btnGameClose.toggle = false;
            this.btnGameClose.visible = true;
            try
            {
                this.btnGameClose["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnForum_ESCMenu_asset_0(param1:int)
        {
            var curFrame:* = param1;
            if (this.btnForum != null && curFrame >= 1 && curFrame <= 10 && (this.__setPropDict[this.btnForum] == undefined || !(int(this.__setPropDict[this.btnForum]) >= 1 && int(this.__setPropDict[this.btnForum]) <= 10)))
            {
                this.__setPropDict[this.btnForum] = curFrame;
                try
                {
                    this.btnForum["componentInspectorSetting"] = true;
                }
                catch (e:Error)
                {
                }
                this.btnForum.autoRepeat = false;
                this.btnForum.autoSize = "none";
                this.btnForum.enabled = true;
                this.btnForum.focusable = false;
                this.btnForum.groupName = "";
                this.btnForum.label = "";
                this.btnForum.overlayAlign = "none";
                this.btnForum.overlayImg = "";
                this.btnForum.overlayPadding = {x:0, y:0};
                this.btnForum.selected = false;
                this.btnForum.toggle = false;
                this.btnForum.visible = true;
                try
                {
                    this.btnForum["componentInspectorSetting"] = false;
                }
                catch (e:Error)
                {
                }
            }
            return;
        }// end function

        function __setProp_btnForum_ESCMenu_asset_20(param1:int)
        {
            var curFrame:* = param1;
            if (this.btnForum != null && curFrame >= 21 && curFrame <= 30 && (this.__setPropDict[this.btnForum] == undefined || !(int(this.__setPropDict[this.btnForum]) >= 21 && int(this.__setPropDict[this.btnForum]) <= 30)))
            {
                this.__setPropDict[this.btnForum] = curFrame;
                try
                {
                    this.btnForum["componentInspectorSetting"] = true;
                }
                catch (e:Error)
                {
                }
                this.btnForum.autoRepeat = false;
                this.btnForum.autoSize = "none";
                this.btnForum.enabled = true;
                this.btnForum.focusable = false;
                this.btnForum.groupName = "";
                this.btnForum.label = "";
                this.btnForum.overlayAlign = "none";
                this.btnForum.overlayImg = "";
                this.btnForum.overlayPadding = {x:0, y:0};
                this.btnForum.selected = false;
                this.btnForum.toggle = false;
                this.btnForum.visible = true;
                try
                {
                    this.btnForum["componentInspectorSetting"] = false;
                }
                catch (e:Error)
                {
                }
            }
            return;
        }// end function

        function __setProp_handler(param1:Object)
        {
            var _loc_2:* = currentFrame;
            if (this.__lastFrameProp == _loc_2)
            {
                return;
            }
            this.__lastFrameProp = _loc_2;
            this.__setProp_btnMarkOfRank_ESCMenu_asset_0(_loc_2);
            this.__setProp_btnCustomerService_ESCMenu_asset_0(_loc_2);
            this.__setProp_btnForum_ESCMenu_asset_0(_loc_2);
            this.__setProp_btnForum_ESCMenu_asset_20(_loc_2);
            return;
        }// end function

        function frame1()
        {
            return;
        }// end function

        function frame10()
        {
            stop();
            return;
        }// end function

        function frame20()
        {
            stop();
            return;
        }// end function

        function frame30()
        {
            stop();
            return;
        }// end function

    }
}
