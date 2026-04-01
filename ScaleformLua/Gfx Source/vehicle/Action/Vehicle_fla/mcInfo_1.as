package Vehicle_fla
{
    import flash.display.*;
    import scaleform.clik.controls.*;

    dynamic public class mcInfo_1 extends MovieClip
    {
        public var labelNameStatic:Label;
        public var labelName:Label;
        public var labelModelStatic:Label;
        public var labelModel:Label;
        public var labelFuelStatic:Label;
        public var labelFuel:Label;
        public var barFuel:StatusIndicator;

        public function mcInfo_1()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_barFuel_mcInfo_track_0();
            this.__setProp_labelNameStatic_mcInfo_text_0();
            this.__setProp_labelModelStatic_mcInfo_text_0();
            this.__setProp_labelFuelStatic_mcInfo_text_0();
            this.__setProp_labelName_mcInfo_text_0();
            this.__setProp_labelModel_mcInfo_text_0();
            this.__setProp_labelFuel_mcInfo_text_0();
            return;
        }// end function

        function __setProp_barFuel_mcInfo_track_0()
        {
            try
            {
                this.barFuel["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.barFuel.enabled = true;
            this.barFuel.maximum = 100;
            this.barFuel.minimum = 0;
            this.barFuel.value = 0;
            this.barFuel.visible = true;
            try
            {
                this.barFuel["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelNameStatic_mcInfo_text_0()
        {
            try
            {
                this.labelNameStatic["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelNameStatic.autoSize = "center";
            this.labelNameStatic.enabled = true;
            this.labelNameStatic.text = "";
            this.labelNameStatic.visible = true;
            try
            {
                this.labelNameStatic["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelModelStatic_mcInfo_text_0()
        {
            try
            {
                this.labelModelStatic["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelModelStatic.autoSize = "center";
            this.labelModelStatic.enabled = true;
            this.labelModelStatic.text = "";
            this.labelModelStatic.visible = true;
            try
            {
                this.labelModelStatic["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelFuelStatic_mcInfo_text_0()
        {
            try
            {
                this.labelFuelStatic["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelFuelStatic.autoSize = "center";
            this.labelFuelStatic.enabled = true;
            this.labelFuelStatic.text = "";
            this.labelFuelStatic.visible = true;
            try
            {
                this.labelFuelStatic["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelName_mcInfo_text_0()
        {
            try
            {
                this.labelName["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelName.autoSize = "center";
            this.labelName.enabled = true;
            this.labelName.text = "";
            this.labelName.visible = true;
            try
            {
                this.labelName["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelModel_mcInfo_text_0()
        {
            try
            {
                this.labelModel["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelModel.autoSize = "center";
            this.labelModel.enabled = true;
            this.labelModel.text = "";
            this.labelModel.visible = true;
            try
            {
                this.labelModel["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelFuel_mcInfo_text_0()
        {
            try
            {
                this.labelFuel["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelFuel.autoSize = "center";
            this.labelFuel.enabled = true;
            this.labelFuel.text = "";
            this.labelFuel.visible = true;
            try
            {
                this.labelFuel["componentInspectorSetting"] = false;
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
