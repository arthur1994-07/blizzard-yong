package ran.ui.core
{
    import flash.display.*;
    import flash.events.*;
    import flash.external.*;
    import flash.net.*;
    import flash.utils.*;
    import ran.ui.*;
    import ran.ui.events.*;
    import scaleform.clik.core.*;
    import scaleform.gfx.*;

    public class MMap extends UIComponent
    {
        public var nGateMapID:int;
        private var loader:Loader;
        private var background:MovieClip;
        private var border:MovieClip;
        private var mapMask:MovieClip;
        public var mcTooltip:MSimpleTooltip;
        public var layers:MovieClip;
        public var map:MovieClip;
        private var mapLayer:Dictionary;
        private var strMapFile:String;
        public static var coreInstance:IUICoreInterface;

        public function MMap() : void
        {
            this.mapLayer = new Dictionary();
            if (this.mcTooltip != null)
            {
                this.mcTooltip.visible = false;
            }
            addEventListener(Event.REMOVED_FROM_STAGE, this.handleRemove, false, 0, true);
            return;
        }// end function

        public function set MapFile(param1:String)
        {
            this.strMapFile = param1;
            return;
        }// end function

        public function get MapFile()
        {
            return this.strMapFile;
        }// end function

        public function handleRemove(event:Event) : void
        {
            if (this.strMapFile == null || this.strMapFile == "")
            {
                return;
            }
            ExternalInterface.call("OnImageRelease", this.strMapFile);
            this.loader.unloadAndStop(false);
            return;
        }// end function

        private function GetRoot(param1:DisplayObject) : DisplayObject
        {
            if (param1 is MWindow)
            {
                return param1;
            }
            if (coreInstance.IsLoadWidget(param1) == false)
            {
                return this.GetRoot(param1.parent);
            }
            return param1;
        }// end function

        public function LoadMap(param1:String) : void
        {
            if (this.loader != null)
            {
                this.map.removeChild(this.loader);
                ExternalInterface.call("OnImageRelease", this.strMapFile);
            }
            this.strMapFile = param1;
            this.loader = new Loader();
            this.loader.contentLoaderInfo.addEventListener(Event.COMPLETE, this.onLoadComplete, false, 0, true);
            this.loader.load(new URLRequest(param1));
            this.map.addChild(this.loader);
            return;
        }// end function

        public function AddLayer(param1:String) : void
        {
            var _loc_2:* = this.mapLayer[param1];
            if (_loc_2 != null)
            {
                return;
            }
            var _loc_3:* = new MovieClip();
            _loc_3.x = this.map.x;
            _loc_3.y = this.map.y;
            this.layers.addChild(_loc_3);
            this.mapLayer[param1] = _loc_3;
            return;
        }// end function

        public function AddIcon(param1:String, param2:String, param3:String, param4:String = "", param5:String = "", param6:String = "", param7:String = "", param8:String = "") : void
        {
            var _loc_9:* = getDefinitionByName(param3) as Class;
            if (getDefinitionByName(param3) as Class == null)
            {
                return;
            }
            var _loc_10:* = this.mapLayer[param1] as MovieClip;
            if (_loc_10 == null)
            {
                return;
            }
            var _loc_11:* = new _loc_9 as MMapIcon;
            (_loc_11).name = param2;
            _loc_11.tooltip = param4;
            _loc_11.crowType = param5;
            _loc_11.crowSubType = param6;
            _loc_11.customID = param7;
            _loc_11.mapID = param8;
            _loc_11.addEventListener(MouseEvent.ROLL_OVER, this.onIconRollOver, false, 0, true);
            _loc_11.addEventListener(MouseEvent.ROLL_OUT, this.onIconRollOut, false, 0, true);
            _loc_10.addChild(_loc_11);
            return;
        }// end function

        public function SetEvent(param1:String, param2:String, param3:String, param4:String, param5:String, param6:String) : void
        {
            var _loc_7:* = this.mapLayer[param1] as MovieClip;
            if (_loc_7 == null)
            {
                return;
            }
            var _loc_8:* = _loc_7.getChildByName(param2) as MMapIcon;
            if (_loc_8 == null)
            {
                return;
            }
            var _loc_9:* = [param5];
            var _loc_10:* = [param6];
            CustomEventMan.RegEvent(this.GetRoot(this.parent), _loc_8, param3, param4, _loc_9, _loc_10);
            return;
        }// end function

        public function AddTextIcon(param1:String, param2:String, param3:String, param4:String) : void
        {
            var _loc_6:* = null;
            var _loc_7:* = null;
            var _loc_5:* = getDefinitionByName(param3) as Class;
            if (getDefinitionByName(param3) as Class == null)
            {
                return;
            }
            _loc_6 = this.mapLayer[param1] as MovieClip;
            if (_loc_6 == null)
            {
                return;
            }
            _loc_7 = new _loc_5 as MMapIcon;
            _loc_7.name = param2;
            _loc_7.mouseEnabled = false;
            _loc_7.mouseChildren = false;
            _loc_7["textField"].text = param4;
            InteractiveObjectEx.setHitTestDisable(_loc_7, true);
            _loc_6.addChild(_loc_7);
            return;
        }// end function

        public function RemoveLayer(param1:String) : void
        {
            var _loc_2:* = this.mapLayer[param1] as MovieClip;
            if (_loc_2 == null)
            {
                return;
            }
            this.layers.removeChild(_loc_2);
            this.mapLayer[param1] = null;
            delete this.mapLayer[param1];
            return;
        }// end function

        public function RemoveIcon(param1:String, param2:String) : void
        {
            var _loc_3:* = this.mapLayer[param1] as MovieClip;
            if (_loc_3 == null)
            {
                return;
            }
            var _loc_4:* = _loc_3.getChildByName(param2) as MMapIcon;
            _loc_3.removeChild(_loc_4);
            return;
        }// end function

        public function MoveMap(param1:int, param2:int) : void
        {
            var _loc_3:* = null;
            if (this.loader != null && this.loader.content != null)
            {
                if (param1 > 0)
                {
                    param1 = 0;
                }
                if (param2 > 0)
                {
                    param2 = 0;
                }
                if (param1 + this.map.width < this.width)
                {
                    param1 = this.width - this.map.width;
                }
                if (param2 + this.map.height < this.height)
                {
                    param2 = this.height - this.map.height;
                }
            }
            this.map.x = param1;
            this.map.y = param2;
            for (_loc_3 in this.mapLayer)
            {
                
                _loc_5[_loc_3].x = param1;
                _loc_5[_loc_3].y = param2;
            }
            return;
        }// end function

        public function MoveMapDist(param1:int, param2:int) : void
        {
            var _loc_3:* = null;
            if (this.loader != null && this.loader.content != null)
            {
                if (this.map.x + param1 >= 0)
                {
                    param1 = this.map.x * -1;
                }
                if (this.map.y + param2 >= 0)
                {
                    param2 = this.map.y * -1;
                }
                if (this.map.x + param1 + this.map.width < this.width)
                {
                    param1 = 0;
                }
                if (this.map.y + param2 + this.map.height < this.height)
                {
                    param2 = 0;
                }
            }
            this.map.x = this.map.x + param1;
            this.map.y = this.map.y + param2;
            for (_loc_3 in this.mapLayer)
            {
                
                _loc_5[_loc_3].x = _loc_5[_loc_3].x + param1;
                _loc_5[_loc_3].y = _loc_5[_loc_3].y + param2;
            }
            return;
        }// end function

        public function MoveIcon(param1:String, param2:String, param3:int, param4:int) : void
        {
            var _loc_5:* = this.mapLayer[param1] as MovieClip;
            if (_loc_5 == null)
            {
                return;
            }
            var _loc_6:* = _loc_5.getChildByName(param2) as MMapIcon;
            if (_loc_6 == null)
            {
                return;
            }
            _loc_6.x = param3;
            _loc_6.y = param4;
            return;
        }// end function

        public function SetIconTooltip(param1:String, param2:String, param3:String = "") : void
        {
            var _loc_4:* = this.mapLayer[param1] as MovieClip;
            if (_loc_4 == null)
            {
                return;
            }
            var _loc_5:* = _loc_4.getChildByName(param2) as MMapIcon;
            if (_loc_5 == null)
            {
                return;
            }
            _loc_5.tooltip = param3;
            return;
        }// end function

        public function gotoAndStopIcon(param1:String, param2:String, param3:int) : void
        {
            var _loc_4:* = this.mapLayer[param1] as MovieClip;
            if (_loc_4 == null)
            {
                return;
            }
            var _loc_5:* = _loc_4.getChildByName(param2) as MMapIcon;
            if (_loc_5 == null)
            {
                return;
            }
            _loc_5.gotoAndStop(param3);
            return;
        }// end function

        public function RotateIcon(param1:String, param2:String, param3:int) : void
        {
            var _loc_4:* = this.mapLayer[param1] as MovieClip;
            if (_loc_4 == null)
            {
                return;
            }
            var _loc_5:* = _loc_4.getChildByName(param2) as MMapIcon;
            if (_loc_5 == null)
            {
                return;
            }
            _loc_5.rotation = param3;
            return;
        }// end function

        public function SetVisibleLayer(param1:String, param2:int) : void
        {
            var _loc_3:* = this.mapLayer[param1] as MovieClip;
            if (_loc_3 == null)
            {
                return;
            }
            var _loc_4:* = param2 == 0 ? (false) : (true);
            _loc_3.visible = _loc_4;
            return;
        }// end function

        public function SetVisibleIcon(param1:String, param2:String, param3:int) : void
        {
            var _loc_4:* = this.mapLayer[param1] as MovieClip;
            if (_loc_4 == null)
            {
                return;
            }
            var _loc_5:* = param3 == 0 ? (false) : (true);
            var _loc_6:* = _loc_4.getChildByName(param2) as MMapIcon;
            (_loc_6).visible = _loc_5;
            return;
        }// end function

        public function SetHitTestEnable(param1:String, param2:String, param3:String) : void
        {
            var _loc_4:* = this.mapLayer[param1] as MovieClip;
            if (_loc_4 == null)
            {
                return;
            }
            var _loc_5:* = _loc_4.getChildByName(param2) as MMapIcon;
            if (_loc_5 == null)
            {
                return;
            }
            var _loc_6:* = param3 == "0" ? (true) : (false);
            InteractiveObjectEx.setHitTestDisable(_loc_5, _loc_6);
            return;
        }// end function

        private function onLoadComplete(event:Event) : void
        {
            var _loc_2:* = null;
            if (this.map.x > 0)
            {
                this.map.x = 0;
            }
            if (this.map.y > 0)
            {
                this.map.y = 0;
            }
            if (this.map.x + this.map.width < this.width)
            {
                this.map.x = this.width - this.map.width;
            }
            if (this.map.y + this.map.height < this.height)
            {
                this.map.y = this.height - this.map.height;
            }
            for (_loc_2 in this.mapLayer)
            {
                
                _loc_4[_loc_2].x = this.map.x;
                _loc_4[_loc_2].y = this.map.y;
            }
            return;
        }// end function

        private function onIconRollOver(event:MouseEvent) : void
        {
            if (this.mcTooltip == null)
            {
                return;
            }
            var _loc_2:* = event.target as MMapIcon;
            if (_loc_2 == null)
            {
                return;
            }
            var _loc_3:* = DataAdapter.getLargeMapIconTooltip(_loc_2.crowType, _loc_2.crowSubType, _loc_2.customID, _loc_2.mapID);
            var _loc_4:* = _loc_3["tooltip"];
            if (_loc_3["tooltip"] == "" && _loc_2.tooltip.length == 0)
            {
                return;
            }
            if (_loc_4 != "")
            {
                this.mcTooltip.OpenTooltip_html(_loc_4);
            }
            else
            {
                this.mcTooltip.OpenTooltip(_loc_2.tooltip);
            }
            this.mcTooltip.visible = true;
            this.mcTooltip.x = _loc_2.x + this.map.x + 20;
            this.mcTooltip.y = _loc_2.y + this.map.y + 20;
            if (this.mcTooltip.x + this.mcTooltip.width > this.width)
            {
                this.mcTooltip.x = this.width - this.mcTooltip.width;
            }
            if (this.mcTooltip.y + this.mcTooltip.height > this.height)
            {
                this.mcTooltip.y = this.height - this.mcTooltip.height;
            }
            return;
        }// end function

        private function onIconRollOut(event:MouseEvent) : void
        {
            if (this.mcTooltip == null)
            {
                return;
            }
            this.mcTooltip.visible = false;
            return;
        }// end function

    }
}
