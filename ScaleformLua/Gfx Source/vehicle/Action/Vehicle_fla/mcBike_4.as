package Vehicle_fla
{
    import flash.display.*;
    import ran.ui.slot.*;
    import scaleform.clik.controls.*;

    dynamic public class mcBike_4 extends MovieClip
    {
        public var highlight:MovieClip;
        public var infoBoost:MovieClip;
        public var labelSpeed:Label;
        public var labelAbility:Label;
        public var slot1:Slot;
        public var slot2:Slot;
        public var slot3:Slot;
        public var slot4:Slot;
        public var slot5:Slot;
        public var slot6:Slot;

        public function mcBike_4()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_labelSpeed_mcBike_label_0();
            this.__setProp_labelAbility_mcBike_label_0();
            return;
        }// end function

        function __setProp_labelSpeed_mcBike_label_0()
        {
            try
            {
                this.labelSpeed["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelSpeed.autoSize = "right";
            this.labelSpeed.enabled = true;
            this.labelSpeed.text = "";
            this.labelSpeed.visible = true;
            try
            {
                this.labelSpeed["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelAbility_mcBike_label_0()
        {
            try
            {
                this.labelAbility["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelAbility.autoSize = "center";
            this.labelAbility.enabled = true;
            this.labelAbility.text = "";
            this.labelAbility.visible = true;
            try
            {
                this.labelAbility["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function frame1()
        {
            return;
        }// end function

    }
}
