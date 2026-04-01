package MiniGame_Dice_fla
{
    import flash.display.*;
    import flash.events.*;
    import flash.utils.*;
    import ran.ui.slot.*;

    dynamic public class SymbolBronzeBox_7 extends MovieClip
    {
        public var __setPropDict:Dictionary;
        public var __lastFrameProp:int = -1;
        public var slot:Slot;

        public function SymbolBronzeBox_7()
        {
            this.__setPropDict = new Dictionary(true);
            addFrameScript(0, this.frame1, 8, this.frame9, 18, this.frame19, 30, this.frame31, 43, this.frame44);
            addEventListener(Event.FRAME_CONSTRUCTED, this.__setProp_handler, false, 0, true);
            return;
        }// end function

        function __setProp_slot_SymbolBronzeBox_Layer2_0(param1:int)
        {
            var curFrame:* = param1;
            if (this.slot != null && curFrame >= 1 && curFrame <= 19 && (this.__setPropDict[this.slot] == undefined || !(int(this.__setPropDict[this.slot]) >= 1 && int(this.__setPropDict[this.slot]) <= 19)))
            {
                this.__setPropDict[this.slot] = curFrame;
                try
                {
                    this.slot["componentInspectorSetting"] = true;
                }
                catch (e:Error)
                {
                }
                this.slot.overlayImg = "";
                this.slot.visible = false;
                try
                {
                    this.slot["componentInspectorSetting"] = false;
                }
                catch (e:Error)
                {
                }
            }
            return;
        }// end function

        function __setProp_slot_SymbolBronzeBox_Layer2_19(param1:int)
        {
            var curFrame:* = param1;
            if (this.slot != null && curFrame >= 20 && curFrame <= 44 && (this.__setPropDict[this.slot] == undefined || !(int(this.__setPropDict[this.slot]) >= 20 && int(this.__setPropDict[this.slot]) <= 44)))
            {
                this.__setPropDict[this.slot] = curFrame;
                try
                {
                    this.slot["componentInspectorSetting"] = true;
                }
                catch (e:Error)
                {
                }
                this.slot.overlayImg = "";
                this.slot.visible = true;
                try
                {
                    this.slot["componentInspectorSetting"] = false;
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
            this.__setProp_slot_SymbolBronzeBox_Layer2_0(_loc_2);
            this.__setProp_slot_SymbolBronzeBox_Layer2_19(_loc_2);
            return;
        }// end function

        function frame1()
        {
            return;
        }// end function

        function frame9()
        {
            stop();
            return;
        }// end function

        function frame19()
        {
            stop();
            return;
        }// end function

        function frame31()
        {
            stop();
            return;
        }// end function

        function frame44()
        {
            stop();
            return;
        }// end function

    }
}
