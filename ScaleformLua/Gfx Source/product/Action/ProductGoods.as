package 
{
    import scaleform.clik.controls.*;
    import scaleform.clik.core.*;

    dynamic public class ProductGoods extends UIComponent
    {
        public var infoViewGroup:UIComponent;
        public var ProductionButton:Button;

        public function ProductGoods()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_ProductionButton_ProductGoods_Production_0();
            return;
        }// end function

        function __setProp_ProductionButton_ProductGoods_Production_0()
        {
            try
            {
                this.ProductionButton["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.ProductionButton.autoRepeat = false;
            this.ProductionButton.autoSize = "none";
            this.ProductionButton.enabled = true;
            this.ProductionButton.focusable = false;
            this.ProductionButton.groupName = "";
            this.ProductionButton.label = "";
            this.ProductionButton.overlayAlign = "none";
            this.ProductionButton.overlayImg = "";
            this.ProductionButton.overlayPadding = {x:0, y:0};
            this.ProductionButton.selected = false;
            this.ProductionButton.toggle = false;
            this.ProductionButton.visible = true;
            try
            {
                this.ProductionButton["componentInspectorSetting"] = false;
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
