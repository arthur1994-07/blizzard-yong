package 
{
    import ran.ui.core.*;
    import scaleform.clik.controls.*;

    dynamic public class MaskedListItemRenderer_CharSel extends MMaskedListItemRenderer
    {
        public var mcMobileImg:StatusIndicator;

        public function MaskedListItemRenderer_CharSel()
        {
            addFrameScript(0, this.frame1, 9, this.frame10, 19, this.frame20, 29, this.frame30, 39, this.frame40, 40, this.frame41, 49, this.frame50, 59, this.frame60, 69, this.frame70, 79, this.frame80);
            this.__setProp_mcMobileImg_MaskedListItemRenderer_CharSel_MobileIndicatorLayer_0();
            return;
        }// end function

        function __setProp_mcMobileImg_MaskedListItemRenderer_CharSel_MobileIndicatorLayer_0()
        {
            try
            {
                this.mcMobileImg["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.mcMobileImg.enabled = true;
            this.mcMobileImg.maximum = 100;
            this.mcMobileImg.minimum = 0;
            this.mcMobileImg.value = 0;
            this.mcMobileImg.visible = true;
            try
            {
                this.mcMobileImg["componentInspectorSetting"] = false;
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

        function frame40()
        {
            stop();
            return;
        }// end function

        function frame41()
        {
            return;
        }// end function

        function frame50()
        {
            stop();
            return;
        }// end function

        function frame60()
        {
            stop();
            return;
        }// end function

        function frame70()
        {
            stop();
            return;
        }// end function

        function frame80()
        {
            stop();
            return;
        }// end function

    }
}
