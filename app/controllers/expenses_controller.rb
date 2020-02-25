class ExpensesController < ApplicationController
	def index
		if(!params[:concept].nil? and !params[:category_id].nil?)
			if(params[:concept].empty? and params[:category_id].empty?)
				@expenses = Expense.order("date DESC")
			elsif(!params[:concept].empty? and !params[:category_id].empty?)
				@expenses = Expense.where("category_id like ?","%#{params[:category_id]}").where("concept like ?","%#{params[:concept]}").order("date DESC")
			elsif(!params[:concept].empty?)
				@expenses = Expense.where("concept like ?","%#{params[:concept]}").order("date DESC")
			else
				@expenses = Expense.where("category_id like ?","%#{params[:category_id]}").order("date DESC")
			end
		else
			@expenses = Expense.order("date DESC")
		end
	end
end
