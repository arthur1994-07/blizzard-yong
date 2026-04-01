package CharInfo_fla
{
    import flash.display.*;
    import flash.events.*;
    import flash.utils.*;
    import ran.ui.slot.*;
    import scaleform.clik.controls.*;

    dynamic public class WeaponSlot_6 extends MovieClip
    {
        public var __setPropDict:Dictionary;
        public var __lastFrameProp:int = -1;
        public var slot15:Slot;
        public var slot16:Slot;
        public var slot17:Slot;
        public var slot18:Slot;
        public var radioLeft:RadioButton;
        public var radioRight:RadioButton;

        public function WeaponSlot_6()
        {
            this.__setPropDict = new Dictionary(true);
            addFrameScript(0, this.frame1, 9, this.frame10, 19, this.frame20);
            this.__setProp_slot15_WeaponSlot_slot_0();
            this.__setProp_slot16_WeaponSlot_slot_0();
            addEventListener(Event.FRAME_CONSTRUCTED, this.__setProp_handler, false, 0, true);
            return;
        }// end function

        function __setProp_slot15_WeaponSlot_slot_0()
        {
            try
            {
                this.slot15["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.slot15.overlayImg = "weapon_symbol";
            this.slot15.visible = true;
            try
            {
                this.slot15["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_slot16_WeaponSlot_slot_0()
        {
            try
            {
                this.slot16["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.slot16.overlayImg = "weapon_2_symbol";
            this.slot16.visible = true;
            try
            {
                this.slot16["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_slot17_WeaponSlot_slot_0(param1:int)
        {
            var curFrame:* = param1;
            if (this.slot17 != null && curFrame >= 1 && curFrame <= 10 && (this.__setPropDict[this.slot17] == undefined || !(int(this.__setPropDict[this.slot17]) >= 1 && int(this.__setPropDict[this.slot17]) <= 10)))
            {
                this.__setPropDict[this.slot17] = curFrame;
                try
                {
                    this.slot17["componentInspectorSetting"] = true;
                }
                catch (e:Error)
                {
                }
                this.slot17.overlayImg = "weapon_symbol";
                this.slot17.visible = true;
                try
                {
                    this.slot17["componentInspectorSetting"] = false;
                }
                catch (e:Error)
                {
                }
            }
            return;
        }// end function

        function __setProp_slot18_WeaponSlot_slot_0(param1:int)
        {
            var curFrame:* = param1;
            if (this.slot18 != null && curFrame >= 1 && curFrame <= 10 && (this.__setPropDict[this.slot18] == undefined || !(int(this.__setPropDict[this.slot18]) >= 1 && int(this.__setPropDict[this.slot18]) <= 10)))
            {
                this.__setPropDict[this.slot18] = curFrame;
                try
                {
                    this.slot18["componentInspectorSetting"] = true;
                }
                catch (e:Error)
                {
                }
                this.slot18.overlayImg = "weapon_2_symbol";
                this.slot18.visible = true;
                try
                {
                    this.slot18["componentInspectorSetting"] = false;
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
            this.__setProp_slot17_WeaponSlot_slot_0(_loc_2);
            this.__setProp_slot18_WeaponSlot_slot_0(_loc_2);
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

    }
}
