package PointShop_fla
{
    import flash.display.*;
    import scaleform.clik.controls.*;

    dynamic public class MainTimeline extends MovieClip
    {
        public var ErrorMsg:MovieClip;
        public var ItemList:ExternalTileList;
        public var ConditionList:MovieClip;
        public var CartList:MovieClip;
        public var btnReset:Button;

        public function MainTimeline()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_btnReset_Scene1_ItemList_0();
            return;
        }// end function

        function __setProp_btnReset_Scene1_ItemList_0()
        {
            try
            {
                this.btnReset["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnReset.autoRepeat = false;
            this.btnReset.autoSize = "none";
            this.btnReset.enabled = true;
            this.btnReset.focusable = false;
            this.btnReset.groupName = "";
            this.btnReset.label = "";
            this.btnReset.overlayAlign = "none";
            this.btnReset.overlayImg = "";
            this.btnReset.overlayPadding = {x:0, y:0};
            this.btnReset.selected = false;
            this.btnReset.toggle = false;
            this.btnReset.visible = true;
            try
            {
                this.btnReset["componentInspectorSetting"] = false;
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
