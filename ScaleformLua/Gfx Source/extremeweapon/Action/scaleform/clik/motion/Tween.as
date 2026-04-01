package scaleform.clik.motion
{
    import flash.display.*;
    import flash.events.*;
    import flash.geom.*;
    import flash.utils.*;

    public class Tween extends Object
    {
        public var target:Object;
        public var duration:Number;
        public var ease:Function;
        public var easeParam:Object;
        public var onComplete:Function;
        public var onChange:Function;
        public var data:Object;
        public var nextTween:Tween;
        public var frameBased:Boolean = false;
        public var delay:Number = 0;
        public var loop:Boolean = false;
        public var fastTransform:Boolean = true;
        protected var invalid:Boolean;
        protected var next:Tween;
        protected var prev:Tween;
        protected var _position:Number = 0;
        protected var _paused:Boolean = true;
        protected var startMatrix:Matrix;
        protected var deltaMatrix:Matrix;
        protected var targetDO:DisplayObject;
        protected var firstProp:Prop;
        protected var props:Object;
        static var ticker:Shape = new Shape();
        static var workingMatrix:Matrix = new Matrix();
        static var firstTween:Tween;
        static var lastTime:uint = getTimer();
        static var degToRad:Number = 1 / 180 * Math.PI;
        public static var propsDO:Object = {x:true, y:true, rotation:true, scaleX:true, scaleY:true, alpha:true};

        public function Tween(param1:Number, param2:Object = null, param3:Object = null, param4:Object = null)
        {
            this.duration = param1;
            this.target = param2;
            if (param2 is DisplayObject)
            {
                this.targetDO = DisplayObject(param2);
            }
            this.props = param3;
            if (param4)
            {
                this.quickSet(param4);
            }
            if (param4 == null || param4.paused == null)
            {
                this.paused = false;
            }
            return;
        }// end function

        public function set position(param1:Number) : void
        {
            this.updatePosition(param1 + this.delay - this._position);
            return;
        }// end function

        public function get position() : Number
        {
            return this._position - this.delay;
        }// end function

        public function get paused() : Boolean
        {
            return this._paused;
        }// end function

        public function set paused(param1:Boolean) : void
        {
            if (param1 == this._paused)
            {
                return;
            }
            this._paused = param1;
            if (param1)
            {
                removeTween(this);
            }
            else
            {
                if (firstTween)
                {
                    firstTween.prev = this;
                    this.next = firstTween;
                }
                firstTween = this;
                if (this._position >= this.delay + this.duration)
                {
                    this._position = 0;
                }
            }
            return;
        }// end function

        public function reset() : void
        {
            this._position = 0;
            return;
        }// end function

        public function quickSet(param1:Object) : void
        {
            var _loc_2:* = null;
            for (_loc_2 in param1)
            {
                
                this[_loc_2] = _loc_4[_loc_2];
            }
            return;
        }// end function

        protected function constructProp(param1:String) : Prop
        {
            var _loc_2:* = new Prop();
            _loc_2.name = param1;
            _loc_2.prev = null;
            if (this.firstProp)
            {
                this.firstProp.prev = _loc_2;
            }
            _loc_2.next = this.firstProp;
            var _loc_3:* = _loc_2;
            this.firstProp = _loc_2;
            return _loc_3;
        }// end function

        protected function init() : void
        {
            var _loc_2:* = null;
            var _loc_3:* = null;
            var _loc_1:* = false;
            for (_loc_2 in this.props)
            {
                
                _loc_3 = this.constructProp(_loc_2);
                var _loc_6:* = this.target[_loc_2];
                _loc_3.start = this.target[_loc_2];
                _loc_3.delta = _loc_5[_loc_2] - _loc_6;
            }
            if (_loc_1)
            {
                this.startMatrix = new Matrix(this.targetDO.scaleX, this.targetDO.rotation * degToRad, this.targetDO.alpha, this.targetDO.scaleY, this.targetDO.x, this.targetDO.y);
                this.deltaMatrix = new Matrix(isNaN(_loc_5.scaleX) ? (0) : (_loc_5.scaleX - this.startMatrix.a), isNaN(_loc_5.rotation) ? (0) : ((_loc_5.rotation - this.targetDO.rotation) * degToRad), isNaN(_loc_5.alpha) ? (0) : (_loc_5.alpha - this.startMatrix.c), isNaN(_loc_5.scaleY) ? (0) : (_loc_5.scaleY - this.startMatrix.d), isNaN(_loc_5.x) ? (0) : (_loc_5.x - this.startMatrix.tx), isNaN(_loc_5.y) ? (0) : (_loc_5.y - this.startMatrix.ty));
            }
            this.props = null;
            return;
        }// end function

        protected function updatePosition(param1:Number) : void
        {
            var _loc_5:* = NaN;
            var _loc_6:* = NaN;
            var _loc_7:* = NaN;
            if (this.target == null)
            {
                this.paused = true;
                var _loc_3:* = true;
                return;
            }
            this._position = this._position + param1;
            if (this._position <= this.delay)
            {
                return;
            }
            if (this.props)
            {
                this.init();
            }
            var _loc_2:* = (this._position - this.delay) / this.duration;
            _loc_3 = _loc_2 >= 1;
            if (_loc_3)
            {
                _loc_2 = 1;
                this._position = this.duration + this.delay;
            }
            if (this.ease != null)
            {
                _loc_2 = this.easeParam == null ? (this.ease(_loc_2, 0, 1, 1)) : (this.ease(_loc_2, 0, 1, 1, this.easeParam));
            }
            if (this.startMatrix)
            {
                _loc_5 = this.startMatrix.b + this.deltaMatrix.b * _loc_2;
                if (_loc_5)
                {
                    _loc_6 = Math.cos(_loc_5);
                    _loc_7 = Math.sin(_loc_5);
                }
                else
                {
                    _loc_6 = 1;
                    _loc_7 = 0;
                }
                workingMatrix.a = _loc_6 * this.startMatrix.a + this.deltaMatrix.a * _loc_2;
                workingMatrix.b = _loc_7;
                workingMatrix.c = -_loc_7;
                workingMatrix.d = _loc_6 * this.startMatrix.d + this.deltaMatrix.d * _loc_2;
                workingMatrix.tx = this.startMatrix.tx + this.deltaMatrix.tx * _loc_2;
                workingMatrix.ty = this.startMatrix.ty + this.deltaMatrix.ty * _loc_2;
                if (this.deltaMatrix.c)
                {
                    this.targetDO.alpha = this.startMatrix.c + this.deltaMatrix.c * _loc_2;
                }
            }
            var _loc_4:* = this.firstProp;
            while (_loc_4)
            {
                
                this.target[_loc_4.name] = _loc_4.start + _loc_4.delta * _loc_2;
                _loc_4 = _loc_4.next;
            }
            if (this.onChange != null)
            {
                this.onChange(this);
            }
            if (_loc_3)
            {
                if (this.loop)
                {
                    this.reset();
                }
                else
                {
                    this.paused = true;
                }
                if (this.nextTween)
                {
                    this.nextTween.paused = false;
                }
                if (this.onComplete != null)
                {
                    this.onComplete(this);
                }
            }
            return;
        }// end function

        static function tick(event:Event) : void
        {
            var _loc_5:* = null;
            var _loc_2:* = getTimer();
            var _loc_3:* = _loc_2 - lastTime;
            lastTime = _loc_2;
            var _loc_4:* = firstTween;
            while (_loc_4)
            {
                
                _loc_5 = _loc_4.next;
                _loc_4.updatePosition(_loc_4.frameBased ? (1) : (_loc_3));
                _loc_4 = _loc_5;
            }
            return;
        }// end function

        public static function removeTween(param1:Tween) : void
        {
            if (param1.prev)
            {
                param1.prev.next = param1.next;
            }
            if (param1.next)
            {
                param1.next.prev = param1.prev;
            }
            if (param1 == firstTween)
            {
                firstTween = param1.next;
            }
            var _loc_2:* = null;
            param1.next = null;
            param1.prev = _loc_2;
            return;
        }// end function

        public static function removeAllTweens() : void
        {
            firstTween = null;
            return;
        }// end function

        ticker.addEventListener(Event.ENTER_FRAME, Tween.tick, false, 0, true);
    }
}

import flash.display.*;

import flash.events.*;

import flash.geom.*;

import flash.utils.*;

final class Prop extends Object
{
    public var next:Prop;
    public var prev:Prop;
    public var name:String;
    public var start:Number;
    public var delta:Number;

    function Prop()
    {
        return;
    }// end function

}

