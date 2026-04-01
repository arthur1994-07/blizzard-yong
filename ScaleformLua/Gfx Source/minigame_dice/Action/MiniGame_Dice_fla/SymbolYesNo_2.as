package MiniGame_Dice_fla
{
    import flash.display.*;
    import flash.events.*;
    import flash.utils.*;
    import scaleform.clik.controls.*;

    dynamic public class SymbolYesNo_2 extends MovieClip
    {
        public var mcBronzeReward:MovieClip;
        public var rt:RenderTextureChar;
        public var mcGoldReward1:MovieClip;
        public var mcGoldReward0:MovieClip;
        public var mcGoldReward3:MovieClip;
        public var mcGoldReward2:MovieClip;
        public var __setPropDict:Dictionary;
        public var __lastFrameProp:int = -1;
        public var yes_btn:Button;
        public var no_btn:Button;
        public var PlayGame:Label;
        public var barTimer:StatusIndicator;
        public var Select:Label;
        public var Win:Label;
        public var Lose:Label;
        public var Reward:Label;

        public function SymbolYesNo_2()
        {
            this.__setPropDict = new Dictionary(true);
            addFrameScript(0, this.frame1, 4, this.frame5, 5, this.frame6, 9, this.frame10, 14, this.frame15, 15, this.frame16, 19, this.frame20, 20, this.frame21, 24, this.frame25, 25, this.frame26, 29, this.frame30);
            this.__setProp_yes_btn_SymbolYesNo_Button_0();
            this.__setProp_no_btn_SymbolYesNo_Button_0();
            addEventListener(Event.FRAME_CONSTRUCTED, this.__setProp_handler, false, 0, true);
            return;
        }// end function

        function __setProp_yes_btn_SymbolYesNo_Button_0()
        {
            try
            {
                this.yes_btn["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.yes_btn.autoRepeat = false;
            this.yes_btn.autoSize = "none";
            this.yes_btn.enabled = true;
            this.yes_btn.focusable = false;
            this.yes_btn.groupName = "";
            this.yes_btn.label = "Yes";
            this.yes_btn.overlayAlign = "none";
            this.yes_btn.overlayImg = "";
            this.yes_btn.overlayPadding = {x:0, y:0};
            this.yes_btn.preventAutoSize = false;
            this.yes_btn.selected = false;
            this.yes_btn.toggle = false;
            this.yes_btn.visible = true;
            try
            {
                this.yes_btn["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_no_btn_SymbolYesNo_Button_0()
        {
            try
            {
                this.no_btn["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.no_btn.autoRepeat = false;
            this.no_btn.autoSize = "none";
            this.no_btn.enabled = true;
            this.no_btn.focusable = false;
            this.no_btn.groupName = "";
            this.no_btn.label = "No";
            this.no_btn.overlayAlign = "none";
            this.no_btn.overlayImg = "";
            this.no_btn.overlayPadding = {x:0, y:0};
            this.no_btn.preventAutoSize = false;
            this.no_btn.selected = false;
            this.no_btn.toggle = false;
            this.no_btn.visible = true;
            try
            {
                this.no_btn["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_PlayGame_SymbolYesNo_Label_0(param1:int)
        {
            var curFrame:* = param1;
            if (this.PlayGame != null && curFrame >= 1 && curFrame <= 5 && (this.__setPropDict[this.PlayGame] == undefined || !(int(this.__setPropDict[this.PlayGame]) >= 1 && int(this.__setPropDict[this.PlayGame]) <= 5)))
            {
                this.__setPropDict[this.PlayGame] = curFrame;
                try
                {
                    this.PlayGame["componentInspectorSetting"] = true;
                }
                catch (e:Error)
                {
                }
                this.PlayGame.autoSize = "center";
                this.PlayGame.enabled = true;
                this.PlayGame.text = "Play Game";
                this.PlayGame.visible = true;
                try
                {
                    this.PlayGame["componentInspectorSetting"] = false;
                }
                catch (e:Error)
                {
                }
            }
            return;
        }// end function

        function __setProp_Select_SymbolYesNo_Label_5(param1:int)
        {
            var curFrame:* = param1;
            if (this.Select != null && curFrame >= 6 && curFrame <= 10 && (this.__setPropDict[this.Select] == undefined || !(int(this.__setPropDict[this.Select]) >= 6 && int(this.__setPropDict[this.Select]) <= 10)))
            {
                this.__setPropDict[this.Select] = curFrame;
                try
                {
                    this.Select["componentInspectorSetting"] = true;
                }
                catch (e:Error)
                {
                }
                this.Select.autoSize = "center";
                this.Select.enabled = true;
                this.Select.text = "Select";
                this.Select.visible = true;
                try
                {
                    this.Select["componentInspectorSetting"] = false;
                }
                catch (e:Error)
                {
                }
            }
            return;
        }// end function

        function __setProp_Win_SymbolYesNo_Label_15(param1:int)
        {
            var curFrame:* = param1;
            if (this.Win != null && curFrame >= 16 && curFrame <= 20 && (this.__setPropDict[this.Win] == undefined || !(int(this.__setPropDict[this.Win]) >= 16 && int(this.__setPropDict[this.Win]) <= 20)))
            {
                this.__setPropDict[this.Win] = curFrame;
                try
                {
                    this.Win["componentInspectorSetting"] = true;
                }
                catch (e:Error)
                {
                }
                this.Win.autoSize = "center";
                this.Win.enabled = true;
                this.Win.text = "Win";
                this.Win.visible = true;
                try
                {
                    this.Win["componentInspectorSetting"] = false;
                }
                catch (e:Error)
                {
                }
            }
            return;
        }// end function

        function __setProp_Lose_SymbolYesNo_Label_20(param1:int)
        {
            var curFrame:* = param1;
            if (this.Lose != null && curFrame >= 21 && curFrame <= 25 && (this.__setPropDict[this.Lose] == undefined || !(int(this.__setPropDict[this.Lose]) >= 21 && int(this.__setPropDict[this.Lose]) <= 25)))
            {
                this.__setPropDict[this.Lose] = curFrame;
                try
                {
                    this.Lose["componentInspectorSetting"] = true;
                }
                catch (e:Error)
                {
                }
                this.Lose.autoSize = "center";
                this.Lose.enabled = true;
                this.Lose.text = "Lose";
                this.Lose.visible = true;
                try
                {
                    this.Lose["componentInspectorSetting"] = false;
                }
                catch (e:Error)
                {
                }
            }
            return;
        }// end function

        function __setProp_Reward_SymbolYesNo_Label_25(param1:int)
        {
            var curFrame:* = param1;
            if (this.Reward != null && curFrame >= 26 && curFrame <= 30 && (this.__setPropDict[this.Reward] == undefined || !(int(this.__setPropDict[this.Reward]) >= 26 && int(this.__setPropDict[this.Reward]) <= 30)))
            {
                this.__setPropDict[this.Reward] = curFrame;
                try
                {
                    this.Reward["componentInspectorSetting"] = true;
                }
                catch (e:Error)
                {
                }
                this.Reward.autoSize = "center";
                this.Reward.enabled = true;
                this.Reward.text = "Reward";
                this.Reward.visible = true;
                try
                {
                    this.Reward["componentInspectorSetting"] = false;
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
            this.__setProp_PlayGame_SymbolYesNo_Label_0(_loc_2);
            this.__setProp_Select_SymbolYesNo_Label_5(_loc_2);
            this.__setProp_Win_SymbolYesNo_Label_15(_loc_2);
            this.__setProp_Lose_SymbolYesNo_Label_20(_loc_2);
            this.__setProp_Reward_SymbolYesNo_Label_25(_loc_2);
            return;
        }// end function

        function frame1()
        {
            return;
        }// end function

        function frame5()
        {
            stop();
            return;
        }// end function

        function frame6()
        {
            return;
        }// end function

        function frame10()
        {
            stop();
            return;
        }// end function

        function frame15()
        {
            stop();
            return;
        }// end function

        function frame16()
        {
            return;
        }// end function

        function frame20()
        {
            stop();
            return;
        }// end function

        function frame21()
        {
            return;
        }// end function

        function frame25()
        {
            stop();
            return;
        }// end function

        function frame26()
        {
            return;
        }// end function

        function frame30()
        {
            stop();
            return;
        }// end function

    }
}
