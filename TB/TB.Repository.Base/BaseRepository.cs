using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TB.Domain.EntityModel;
using System.Web.Mvc;

namespace TB.BaseRepo
{
    public interface IRepository<T> : IDisposable
    {
        string ParentId { get; set; }
        Result<T> Execute(Controller context);
    }
    public abstract class BaseRepository<T>:IRepository<T>
    {
        protected QLBH db { get; set; }
        public int? Page { get; set; }
        protected int PageSize { get; set; }
        public string ParentId { get; set; }
        public BaseRepository()
        {
            PageSize = 20;
            Page = 1;
            db = new QLBH();
        }
        public virtual void ValidateCore(Controller CurrentContext) {
        }
        public abstract Result<T> ExecuteCore(Controller CurrentContext);
        public virtual void ExecutedCore(Controller CurrentContext, Result<T> Result) {
        }
        public Result<T> Execute(Controller CurrentContext)
        {
            try
            {
                ValidateCore(CurrentContext);
                var result = ExecuteCore(CurrentContext);
                if (CurrentContext != null)
                {
                    CurrentContext.ViewBag.ParentId = this.ParentId;
                }
                CurrentContext.ViewBag.Message = result;
                ExecutedCore(CurrentContext, result);
                return result;
            }
            catch (Exception ex)
            {
                var failResult = new Result<T>
                {
                    IsSuccess = false,
                    Message = ex.Message
                };
                CurrentContext.ViewBag.Message = failResult;
                return failResult;
            }
        }
        protected Result<T> Success(T data, string message = null)
        {
            return new Result<T>
            {
                Data = data,
                IsSuccess = true,
                Message = message ?? "success"
            };
        }
        protected Result<T> Fail(string message = null)
        {
            return new Result<T>
            {
                IsSuccess = false,
                Message = message ?? "fail"
            };
        }

        public void Dispose()
        {
        }
    }
    public class Result<T>
    {
        public T Data { get; set; }
        public bool IsSuccess { get; set; }
        public string Message { get; set; }
    }
   
}
