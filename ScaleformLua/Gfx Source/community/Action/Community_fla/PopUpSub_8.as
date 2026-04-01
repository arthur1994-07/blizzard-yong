package Community_fla
{
    import flash.display.*;
    import scaleform.clik.controls.*;

    dynamic public class PopUpSub_8 extends MovieClip
    {
        public var item1:ListItemRenderer;
        public var item2:ListItemRenderer;
        public var main:TileList;

        public function PopUpSub_8()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_main_PopUpSub_sub_0();
            return;
        }// end function

        function __setProp_main_PopUpSub_sub_0()
        {
            try
            {
                this.main["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.main.columnWidth = 0;
            this.main.direction = "vertical";
            this.main.enabled = true;
            this.main.externalColumnCount = 0;
            this.main.focusable = true;
            this.main.itemRendererName = "";
            this.main.itemRendererInstanceName = "item";
            this.main.margin = 0;
            this.main.inspectablePadding = {top:0, right:0, bottom:0, left:0};
            this.main.rowHeight = 0;
            this.main.scrollBar = "";
            this.main.visible = true;
            this.main.wrapping = "normal";
            try
            {
                this.main["componentInspectorSetting"] = false;
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
