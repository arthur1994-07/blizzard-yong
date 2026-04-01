package GuideSummon_fla
{
    import flash.display.*;
    import flash.external.*;
    import flash.utils.*;
    import ran.ui.utils.*;
    import scaleform.clik.controls.*;
    import scaleform.clik.events.*;

    dynamic public class MainTimeline extends MovieClip
    {
        public var btnSummon:Button;
        public const CheckHeight:int = 30;
        public var CheckDic:Dictionary;
        public var CheckCount:int;

        public function MainTimeline()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_btnSummon_Scene1_asset_0();
            return;
        }// end function

        public function InsertCheck(param1:uint, param2:String, param3:int, param4:int) : void
        {
            var _loc_6:* = null;
            if (this.CheckDic[param1] != null)
            {
                _loc_6 = "GuideSummon::InsertCheck - Already registered id 0x" + param1.toString(16);
                trace(_loc_6);
                return;
            }
            var _loc_5:* = new mcCheckLabel();
            _loc_5.check.enabled = param4 == 0 ? (false) : (true);
            _loc_5.check.selected = param3 == 0 ? (false) : (true);
            _loc_5.label.enabled = param4 == 0 ? (false) : (true);
            _loc_5.label.text = param2;
            _loc_5.x = 5;
            var _loc_7:* = this;
            _loc_7.CheckCount = this.CheckCount + 1;
            _loc_5.y = 5 + this.CheckHeight * this.CheckCount++;
            _loc_5.id = param1;
            addChild(_loc_5);
            _loc_5.check.addEventListener(ButtonEvent.CLICK, this.onCheckClick, false, 0, true);
            this.CheckDic[param1] = _loc_5;
            return;
        }// end function

        public function SetCheck(param1:uint, param2:int) : void
        {
            var _loc_4:* = null;
            if (this.CheckDic[param1] == null)
            {
                _loc_4 = "GuideSummon::SetCheck - Not registered id 0x" + param1.toString(16);
                trace(_loc_4);
                return;
            }
            var _loc_3:* = this.CheckDic[param1] as mcCheckLabel;
            _loc_3.check.selected = param2 == 0 ? (false) : (true);
            return;
        }// end function

        public function onCheckClick(event:ButtonEvent) : void
        {
            var _loc_3:* = null;
            var _loc_4:* = null;
            var _loc_5:* = null;
            var _loc_6:* = null;
            var _loc_2:* = 0;
            for (_loc_3 in this.CheckDic)
            {
                
                _loc_6 = _loc_8[_loc_3] as mcCheckLabel;
                if (_loc_6.check.selected == true)
                {
                    _loc_2 = _loc_2 | _loc_6.id;
                }
            }
            _loc_4 = [Util.OBJ_TYPE_UINT];
            _loc_5 = [_loc_2];
            ExternalInterface.call("OnCustomEvent", "GuideSummon_GetFlag", _loc_4, _loc_5);
            return;
        }// end function

        public function onSummonClick(event:ButtonEvent) : void
        {
            ExternalInterface.call("OnCustomEvent", "GuideSummon_Summon");
            return;
        }// end function

        function __setProp_btnSummon_Scene1_asset_0()
        {
            try
            {
                this.btnSummon["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnSummon.autoRepeat = false;
            this.btnSummon.autoSize = "none";
            this.btnSummon.enabled = true;
            this.btnSummon.focusable = false;
            this.btnSummon.groupName = "";
            this.btnSummon.label = "";
            this.btnSummon.overlayAlign = "none";
            this.btnSummon.overlayImg = "";
            this.btnSummon.overlayPadding = {x:0, y:0};
            this.btnSummon.selected = false;
            this.btnSummon.toggle = false;
            this.btnSummon.visible = true;
            try
            {
                this.btnSummon["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function frame1()
        {
            this.btnSummon.addEventListener(ButtonEvent.CLICK, this.onSummonClick, false, 0, true);
            this.CheckDic = new Dictionary();
            this.CheckCount = 0;
            return;
        }// end function

    }
}
