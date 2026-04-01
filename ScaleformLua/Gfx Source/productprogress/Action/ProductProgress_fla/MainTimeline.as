package ProductProgress_fla
{
    import flash.display.*;
    import scaleform.clik.controls.*;

    dynamic public class MainTimeline extends MovieClip
    {
        public var productName:Label;
        public var productCount:Label;
        public var progressBar:StatusIndicator;

        public function MainTimeline()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_progressBar_Scene1_progress_0();
            this.__setProp_productName_Scene1_text_0();
            this.__setProp_productCount_Scene1_text_0();
            return;
        }// end function

        function __setProp_progressBar_Scene1_progress_0()
        {
            try
            {
                this.progressBar["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.progressBar.enabled = true;
            this.progressBar.maximum = 100;
            this.progressBar.minimum = 0;
            this.progressBar.value = 0;
            this.progressBar.visible = true;
            try
            {
                this.progressBar["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_productName_Scene1_text_0()
        {
            try
            {
                this.productName["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.productName.autoSize = "center";
            this.productName.enabled = true;
            this.productName.text = "";
            this.productName.visible = true;
            try
            {
                this.productName["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_productCount_Scene1_text_0()
        {
            try
            {
                this.productCount["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.productCount.autoSize = "center";
            this.productCount.enabled = true;
            this.productCount.text = "";
            this.productCount.visible = true;
            try
            {
                this.productCount["componentInspectorSetting"] = false;
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
