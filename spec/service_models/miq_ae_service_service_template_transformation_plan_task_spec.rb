describe MiqAeMethodService::MiqAeServiceServiceTemplateTransformationPlanTask do
  let(:conversion_host_1) { FactoryGirl.create(:conversion_host) }
  let(:service_conversion_host_1) { MiqAeMethodService::MiqAeServiceConversionHost.find(conversion_host_1.id) }
  let(:conversion_host_2) { FactoryGirl.create(:conversion_host) }
  let(:service_conversion_host_2) { MiqAeMethodService::MiqAeServiceConversionHost.find(conversion_host_2.id) }
  let(:task) { FactoryGirl.create(:service_template_transformation_plan_task, :conversion_host => conversion_host_1) }
  let(:service_task) { MiqAeMethodService::MiqAeServiceServiceTemplateTransformationPlanTask.find(task.id) }

  describe "#conversion_host=" do
    it "removes the conversion host if arg is nil" do
      service_task.conversion_host = nil
      expect(task.reload.conversion_host).to be_nil
    end

    it "sets the conversion host if arg is not nil" do
      service_task.conversion_host = service_conversion_host_2
      expect(task.reload.conversion_host).to eq(conversion_host_2)
    end
  end
end
