<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Payment extends CI_Controller {

public function __construct()
{
	parent::__construct();
	$this->load->model('payment_model');
}

public function index()
{
	///session data - customer
	$customerid=1;
	$customerdata=$this->payment_model->fetchCustomerData($customerid);
	$this->load->view('payment-view',['customerdata'=>$customerdata]);
}
public function checkout()
{
	$customer_id=$this->input->post('customer_id');
	$customer_name=$this->input->post('customer_name');
	$customer_email=$this->input->post('customer_email');
	$customer_mobileno=$this->input->post('customer_mobileno');
	echo $customer_addr=$this->input->post('customer_address');
	echo $customer_address=str_replace(array("\n","\r","\r\n"),'-',$customer_addr);
	$price=$this->input->post('price');

date_default_timezone_set('Asia/Calcutta');
$datenow = date("d/m/Y h:m:s");
$transactionDate = str_replace(" ", "%20", $datenow);

$transactionId = rand(1,1000000);
require_once APPPATH.'\controllers\Atompay-ci\Atompay\TransactionRequest.php';

$transactionRequest = new TransactionRequest();

$returnurl=base_url('Payment/PaymentStatus');
//Setting all values here
$transactionRequest->setMode("test");
$transactionRequest->setLogin(197);
///your transaction password
$transactionRequest->setPassword("Test@123");
$transactionRequest->setProductId("NSE");
$transactionRequest->setAmount($price);
$transactionRequest->setTransactionCurrency("INR");
$transactionRequest->setTransactionAmount(0);
$transactionRequest->setReturnUrl($returnurl);
$transactionRequest->setClientCode($customer_id);
$transactionRequest->setTransactionId($transactionId);
$transactionRequest->setTransactionDate($transactionDate);
$transactionRequest->setCustomerName($customer_name);
$transactionRequest->setCustomerEmailId($customer_email);
$transactionRequest->setCustomerMobile($customer_mobileno);
$transactionRequest->setCustomerBillingAddress($customer_address);
$transactionRequest->setCustomerAccount("639827");
//you will get it when you login / purchase
$transactionRequest->setReqHashKey("KEY123657234");


$url = $transactionRequest->getPGUrl();

header("Location: $url");

}

public function PaymentStatus()
{
require_once APPPATH.'\controllers\Atompay-ci\Atompay\TransactionResponse.php';
$transactionResponse = new TransactionResponse();
//you get get from atom 
$transactionResponse->setRespHashKey("KEYRESP123657234");
//echo '<pre>';
if($transactionResponse->validateResponse($_POST)){
    echo "Transaction Processed <br/>";
   // print_r($_POST);

    $data=array(
    	'mmp_txn'=>$_POST['mmp_txn'],
    	'mer_txn'=>$_POST['mer_txn'],
    	'amt'=>$_POST['amt'],
    	'prod'=>$_POST['prod'],
    	'date'=>$_POST['date'],
    	'bank_txn'=>$_POST['bank_txn'],
    	'f_code'=>$_POST['f_code'],
    	'clientcode'=>$_POST['clientcode'],
    	'bank_name'=>$_POST['bank_name'],
    	'merchant_id'=>$_POST['merchant_id'],
    	'udf9'=>$_POST['udf9'],
    	'discriminator'=>$_POST['discriminator'],
    	'surcharge'=>$_POST['surcharge'],
    	'CardNumber'=>$_POST['CardNumber'],
    	'udf1'=>$_POST['udf1'],
    	'udf2'=>$_POST['udf2'],
    	'udf3'=>$_POST['udf3'],
    	'udf4'=>$_POST['udf4'],
    	'udf5'=>$_POST['udf5'],
    	'udf6'=>$_POST['udf6'],
    	'signature'=>$_POST['signature']
    );
    $this->payment_model->paymentInsert($data);

if($_POST['f_code']=='Ok'){
    redirect('payment/paymentSuccess');
}else if($_POST['f_code']=='F'){
	redirect('payment/paymentFailure');
}
else
{
redirect('payment/paymentCancel');	
}
} else {
    echo "Invalid Signature";
}
}
public function paymentSuccess(){
	echo 'payment success';
}

public function paymentFailure(){
	echo 'payment failed';
}

public function paymentCancel(){
	echo 'payment cancel';
}
}
