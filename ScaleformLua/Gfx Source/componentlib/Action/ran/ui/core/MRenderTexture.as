package ran.ui.core
{
    import flash.display.*;
    import flash.events.*;
    import flash.geom.*;
    import flash.utils.*;
    import ran.ui.*;
    import scaleform.clik.constants.*;
    import scaleform.clik.core.*;
    import scaleform.clik.utils.*;

    public class MRenderTexture extends UIComponent
    {
        private var _isRef:Boolean = false;
        private var _classID:String = "";
        private var _linkID:String = "";
        private var _textureID:int = -1;
        private var _serverID:int = -1;
        private var _clubID:int = -1;
        public var renderTexture:MovieClip;

        public function MRenderTexture()
        {
            return;
        }// end function

        override protected function preInitialize() : void
        {
            constraints = new Constraints(this, ConstrainMode.REFLOW);
            return;
        }// end function

        override protected function configUI() : void
        {
            super.configUI();
            addEventListener(Event.ADDED_TO_STAGE, this.handleAddedStage);
            addEventListener(Event.REMOVED_FROM_STAGE, this.handleRemoveFrame);
            return;
        }// end function

        override protected function draw() : void
        {
            if (isInvalid(InvalidationType.SIZE))
            {
                constraints.update(_width, _height);
            }
            return;
        }// end function

        public function CreateTexture(param1:String, param2:String, param3:int) : void
        {
            if (this._textureID != -1)
            {
                while (this.renderTexture.numChildren != 0)
                {
                    
                    this.renderTexture.removeChildAt(0);
                }
                DataAdapter.unregisterRenderTexture(this._textureID);
            }
            this._classID = param1;
            this._linkID = param2;
            this._textureID = param3;
            var _loc_4:* = getDefinitionByName(this._classID) as Class;
            if (_loc_4 == null)
            {
                return;
            }
            var _loc_5:* = new _loc_4 as MovieClip;
            if (this.renderTexture == null)
            {
                this.renderTexture = new MovieClip();
                addChild(this.renderTexture);
            }
            this.renderTexture.addChild(_loc_5);
            if (DataAdapter.registerRenderTexture != null)
            {
                DataAdapter.registerRenderTexture(this._textureID, this._linkID, _width, _height);
                this._isRef = true;
            }
            return;
        }// end function

        public function CreateClubIconTexture(param1:String, param2:String, param3:int, param4:int, param5:int, param6:int, param7:int = -1) : void
        {
            var _loc_8:* = null;
            var _loc_9:* = null;
            var _loc_10:* = null;
            var _loc_11:* = null;
            var _loc_12:* = null;
            if (this.renderTexture)
            {
                while (this.renderTexture.numChildren != 0)
                {
                    
                    this.renderTexture.removeChildAt(0);
                }
            }
            else
            {
                this.renderTexture = new MovieClip();
                addChild(this.renderTexture);
            }
            this._classID = param1;
            this._linkID = param2;
            this._serverID = param3;
            this._clubID = param4;
            if (DataAdapter.clubIconRenderTexture != null)
            {
                if (param7 != 0 && DataAdapter.clubIconRenderTexture(this._linkID, this._serverID, this._clubID) == true)
                {
                    _loc_8 = getDefinitionByName(this._classID) as Class;
                    if (_loc_8 == null)
                    {
                        return;
                    }
                }
                else
                {
                    _loc_8 = getDefinitionByName("ClubIconSample_RT_MC") as Class;
                    if (_loc_8 == null)
                    {
                        return;
                    }
                }
                _loc_9 = new _loc_8 as MovieClip;
                if (_loc_9.getChildAt(0) is Bitmap)
                {
                    _loc_10 = _loc_9.getChildAt(0) as Bitmap;
                    _loc_11 = new BitmapData(param5, param6);
                    _loc_11.copyPixels(_loc_10.bitmapData, new Rectangle(0, 0, param5, param6), new Point(0, 0));
                    _loc_12 = new Bitmap(_loc_11);
                    this.renderTexture.addChild(_loc_12);
                }
            }
            return;
        }// end function

        public function DestroyTexture() : void
        {
            if (this._classID == "" && this._linkID == "" && this._textureID == -1)
            {
                return;
            }
            while (this.renderTexture.numChildren != 0)
            {
                
                this.renderTexture.removeChildAt(0);
            }
            DataAdapter.unregisterRenderTexture(this._textureID);
            return;
        }// end function

        private function handleAddedStage(event:Event) : void
        {
            if (this._textureID == -1 || this._linkID.length == 0)
            {
                return;
            }
            if (this._isRef == false)
            {
                DataAdapter.registerRenderTexture(this._textureID, this._linkID, _width, _height);
                this._isRef = true;
            }
            return;
        }// end function

        private function handleRemoveFrame(event:Event) : void
        {
            DataAdapter.unregisterRenderTexture(this._textureID);
            this._isRef = false;
            return;
        }// end function

    }
}
