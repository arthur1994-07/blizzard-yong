package 
{
    import ran.ui.core.*;

    dynamic public class PrivateMarketPopup extends MPrivateMarketDisplay
    {

        public function PrivateMarketPopup()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_btnMarket_PrivateMarketPopup_Layer1_0();
            return;
        }// end function

        function __setProp_btnMarket_PrivateMarketPopup_Layer1_0()
        {
            try
            {
                btnMarket["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            btnMarket.autoRepeat = false;
            btnMarket.autoSize = "none";
            btnMarket.enabled = true;
            btnMarket.focusable = false;
            btnMarket.groupName = "";
            btnMarket.label = "ToggleButton";
            btnMarket.overlayAlign = "none";
            btnMarket.overlayImg = "";
            btnMarket.overlayPadding = {x:0, y:0};
            btnMarket.selected = false;
            btnMarket.toggle = true;
            btnMarket.visible = true;
            try
            {
                btnMarket["componentInspectorSetting"] = false;
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
