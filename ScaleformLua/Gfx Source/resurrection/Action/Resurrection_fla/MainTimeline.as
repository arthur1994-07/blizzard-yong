package Resurrection_fla
{
    import flash.display.*;
    import ran.ui.slot.*;
    import scaleform.clik.controls.*;

    dynamic public class MainTimeline extends MovieClip
    {
        public var labelMain:Label;
        public var labelSub:Label;
        public var labelAD:Label;
        public var checkAuto:CheckBox;
        public var btnResurrection:Button;
        public var btnAction:Button;
        public var btnBuy:Button;
        public var slot:Slot;
        public var checkAuto_text:Label;

        public function MainTimeline()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_btnAction_Scene1_asset_0();
            this.__setProp_btnResurrection_Scene1_asset_0();
            this.__setProp_btnBuy_Scene1_asset_0();
            return;
        }// end function

        function __setProp_btnAction_Scene1_asset_0()
        {
            try
            {
                this.btnAction["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnAction.autoRepeat = false;
            this.btnAction.autoSize = "none";
            this.btnAction.enabled = true;
            this.btnAction.focusable = false;
            this.btnAction.groupName = "";
            this.btnAction.label = "";
            this.btnAction.overlayAlign = "none";
            this.btnAction.overlayImg = "";
            this.btnAction.overlayPadding = {x:0, y:0};
            this.btnAction.preventAutoSize = true;
            this.btnAction.selected = false;
            this.btnAction.toggle = false;
            this.btnAction.visible = true;
            try
            {
                this.btnAction["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnResurrection_Scene1_asset_0()
        {
            try
            {
                this.btnResurrection["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnResurrection.autoRepeat = false;
            this.btnResurrection.autoSize = "none";
            this.btnResurrection.enabled = true;
            this.btnResurrection.focusable = false;
            this.btnResurrection.groupName = "";
            this.btnResurrection.label = "";
            this.btnResurrection.overlayAlign = "none";
            this.btnResurrection.overlayImg = "";
            this.btnResurrection.overlayPadding = {x:0, y:0};
            this.btnResurrection.preventAutoSize = true;
            this.btnResurrection.selected = false;
            this.btnResurrection.toggle = false;
            this.btnResurrection.visible = true;
            try
            {
                this.btnResurrection["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnBuy_Scene1_asset_0()
        {
            try
            {
                this.btnBuy["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnBuy.autoRepeat = false;
            this.btnBuy.autoSize = "none";
            this.btnBuy.enabled = true;
            this.btnBuy.focusable = false;
            this.btnBuy.groupName = "";
            this.btnBuy.label = "";
            this.btnBuy.overlayAlign = "none";
            this.btnBuy.overlayImg = "";
            this.btnBuy.overlayPadding = {x:0, y:0};
            this.btnBuy.preventAutoSize = true;
            this.btnBuy.selected = false;
            this.btnBuy.toggle = false;
            this.btnBuy.visible = true;
            try
            {
                this.btnBuy["componentInspectorSetting"] = false;
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
